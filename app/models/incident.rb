class Incident < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :tech, class_name: 'User', foreign_key: 'tech_id'
  belongs_to :incident_state_id_for_tech, class_name: 'IncidentsState', foreign_key: 'incident_state_id_for_tech_id'
  belongs_to :incident_state_id_for_user, class_name: 'IncidentsState', foreign_key: 'incident_state_id_for_user_id'
  belongs_to :sous_category
  belongs_to :category


  has_many :responses, dependent: :destroy
  has_many :archives, dependent: :destroy
  has_many :file_incidents, dependent: :destroy

  accepts_nested_attributes_for :file_incidents

  validates :title, presence: true, length: { in: 0..199 }
  validates :content, presence: true
  validates :category_id, presence: true
  validates :sous_category_id, presence: true
  validates :lvl_urgence_user, presence: true
  validates :lvl_urgence_tech, presence: true
  validates :cloture_user, presence: true, inclusion: { in: [true, false] }
  validates :cloture_tech, presence: true, inclusion: { in: [true, false] }
  validates :notify_for_user, presence: true, inclusion: { in: [true, false] }
  validates :notify_for_tech, presence: true, inclusion: { in: [true, false] }
  validates :incident_state_id_for_user_id, presence: true
  validates :incident_state_id_for_tech_id, presence: true
  validates :lvl_of_incident, presence: true

  before_update :verify_if_incident_is_reaffected

  before_validation :set_lvl_of_incidents_to_default
  before_validation :set_cloture_tech_to_default
  before_validation :set_cloture_user_to_default
  before_validation :set_notify_for_user_to_default
  before_validation :set_notify_for_tech_to_default
  before_validation :set_lvl_urgence_tech_to_default
  before_validation :set_incident_state_id_for_user_id
  before_validation :set_incident_state_id_for_tech_id
  before_validation :set_lvl_urgence_user_to_max

  def set_lvl_urgence_user_to_max
    self.lvl_urgence_user = sous_category.lvl_urgence_max if lvl_urgence_user > sous_category.lvl_urgence_max
  end

  def set_incident_state_id_for_user_id
    self.incident_state_id_for_user_id = 1
  end

  def set_incident_state_id_for_tech_id
    self.incident_state_id_for_tech_id = 1
  end

  def set_lvl_urgence_tech_to_default
    self.lvl_urgence_tech = 1
  end

  def set_notify_for_user_to_default
    self.notify_for_user = 0
  end

  def set_notify_for_tech_to_default
    self.notify_for_tech = 1
  end

  def set_lvl_of_incidents_to_default
    self.lvl_of_incident = 1
  end

  def set_cloture_tech_to_default
    self.cloture_tech = 0
  end

  def set_cloture_user_to_default
    self.cloture_user = 0
  end
  # This appenned every time an incident have params updated.
  # It verify if the tech have changed.
  def verify_if_incident_is_reaffected
    if tech_id_changed?
      self.incident_state_id_for_user_id = '2'
      self.incident_state_id_for_tech_id = '2'
      @users = User.all
      @response = Response.new(content: 'Incident affecté', incident_id: id, sender_id: user_id)
      @response.save!
      begin
        AppMailer.incident_affected_for_tech(self, @users).deliver_now
      rescue
        nil
      end
      begin
        AppMailer.incident_affected_for_creator(self, @users).deliver_now
      rescue
        nil
      end
    end
  end

  # Mmh...
  def downloadable?(user)
    user != :guest
  end

  # Cron job every day that verify all the incidents non-clotured
  # are not pending since 3 days.
  # Or it cloture it automatically, it sends emails and archive them.
  def self.cloture_automaticaly
    @users = User.all
    Incident.where(incident_state_id_for_tech_id: 9).each do |incident|
      next unless Time.now - 3.days > incident.resolved_at - 1.hour
      incident.update(incident_state_id_for_user_id: 7, incident_state_id_for_tech_id: 7)

      @response = Response.new(content: 'Incident cloturé automatiquement', incident_id: incident.id, sender_id: incident.tech_id)
      @response.save!
      @responses = Response.all.where(incident_id: incident.id)
      @responses.each do |response|
        @archive = Archive.new(content: response.content, incident_id: response.incident_id, sender_id: response.sender_id, receiver_id: response.receiver_id, ip_adress_sender: response.ip_adress_sender, pc_id: response.pc_id)
        response.destroy if @archive.save!
        begin
          AppMailer.incident_clotured_for_creator_if_is_creator_clotured(incident, @users, @responses).deliver_now
        rescue
          nil
        end
        unless incident.tech_id.nil?
          begin
            AppMailer.incident_clotured_for_tech_if_is_creator_clotured(incident, @users).deliver_now
          rescue
            nil
          end
        end
        begin
          AppMailer.incident_clotured_for_disp_if_is_creator_clotured(incident, @users).deliver_now
        rescue
          nil
        end
      end
    end
  end
end

# incident.rb
class Incident < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :tech, class_name: 'User', foreign_key: 'tech_id'
  belongs_to :incident_state_id_for_tech,
             class_name: 'IncidentsState',
             foreign_key: 'incident_state_id_for_tech_id'
  belongs_to :incident_state_id_for_user,
             class_name: 'IncidentsState',
             foreign_key: 'incident_state_id_for_user_id'
  belongs_to :sous_category
  belongs_to :category

  has_many :responses, dependent: :destroy
  has_many :archives, dependent: :destroy

  validates :title, presence: true, length: { in: 0..199 }
  validates :user_id, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :sous_category_id, presence: true
  validates :lvl_urgence_user, presence: true
  validates :incident_state_id_for_user_id, presence: true
  validates :incident_state_id_for_tech_id, presence: true

  before_create :set_lvl_urgence_user_to_max
  before_validation :set_incident_state_id_for_user_id
  before_validation :set_incident_state_id_for_tech_id

  def set_incident_state_id_for_user_id
    self.incident_state_id_for_user_id ||= 1
  end

  def set_incident_state_id_for_tech_id
    self.incident_state_id_for_tech_id ||= 1
  end

  def set_lvl_urgence_user_to_max
    self.lvl_urgence_user = sous_category.lvl_urgence_max if lvl_urgence_user > sous_category.lvl_urgence_max
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
        @archive = Archive.new(content: response.content, incident_id: response.incident_id, sender_id: response.sender_id, ip_address_sender: response.ip_address_sender, pc_id: response.pc_id)
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

  def clotured_or_rejected?
    [10, 7].include?(self.incident_state_id_for_user_id) ? true : false
  end

  def responses_or_archives
    clotured_or_rejected? ? archives : responses
  end
end

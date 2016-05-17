class Incident < ActiveRecord::Base
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :tech, class_name: 'User', foreign_key: 'tech_id'
  belongs_to :incident_state_id_for_tech, class_name: 'IncidentsState', foreign_key: 'incident_state_id_for_tech_id'
  belongs_to :incident_state_id_for_user, class_name: 'IncidentsState', foreign_key: 'incident_state_id_for_user_id'
  belongs_to :sous_category
  belongs_to :category
  belongs_to :agency, class_name: 'Agency', foreign_key: 'agency_id'
  has_many :responses
  has_many :archives
  has_many :file_incidents
  accepts_nested_attributes_for :file_incidents
  module Incidentmod
    attr_accessor :name, :content, :tech_id, :incident_state_id_for_user, :incident_state_id_for_tech, :lvl_urgence_user, :lvl_urgence_tech, :file
  end
  validates :title, presence: true, length: { in: 0..199 }
  validates :content, presence: true
  validates :category_id, presence: true
  validates :sous_category_id, presence: true

  before_create :set_lvl_urgence_user_if_it_is_too_larger_than_lvl_urgence_max
  before_update :verify_if_incident_is_reaffected

  def verify_if_incident_is_reaffected
    if self.tech_id_changed?
      self.incident_state_id_for_user_id = '2'
      self.incident_state_id_for_tech_id = '2'
      @users = User.all
      @response = Response.new(content: 'Incident affecté', incident_id: id, sender_id: user_id)
      @response.save!
      AppMailer.incident_affected_for_tech(self, @users).deliver_now
      AppMailer.incident_affected_for_disp(self, @users).deliver_now
      AppMailer.incident_affected_for_creator(self, @users).deliver_now

    end
  end

  def set_lvl_urgence_user_if_it_is_too_larger_than_lvl_urgence_max
    self.lvl_urgence_user = '1' if lvl_urgence_user == '50'

    self.lvl_urgence_user = sous_category.lvl_urgence_max if lvl_urgence_user > sous_category.lvl_urgence_max
  end

  def downloadable?(user)
    user != :guest
  end

  def self.cloture_automaticaly
    @users = User.all
    Incident.where(incident_state_id_for_tech_id: 9).each do |incident|
      next unless Time.now - 3.days > incident.resolved_at - 1.hour
      incident.update(incident_state_id_for_user_id: 7, incident_state_id_for_tech_id: 7)

      @response = Response.new(content: 'Incident cloturé automatiquement', incident_id: incident.id, sender_id: incident.tech_id)
      @response.save!
      @responses = Response.all.where(incident_id: incident.id)
      @responses.each do |response|
        # if !response.attach_updated_at.nil?
          # @archive = Archive.new(content: response.content, incident_id: response.incident_id, sender_id: response.sender_id, receiver_id: response.receiver_id, ip_adress_sender: response.ip_adress_sender, pc_id: response.pc_id, attach_updated_at: response.attach_updated_at, attach_content_type: response.attach_content_type, attach_file_name: response.attach_file_name, attach_file_size: response.attach_file_size)
        # else
          @archive = Archive.new(content: response.content, incident_id: response.incident_id, sender_id: response.sender_id, receiver_id: response.receiver_id, ip_adress_sender: response.ip_adress_sender, pc_id: response.pc_id)
        # end
        response.destroy if @archive.save!
        AppMailer.incident_clotured_for_creator_if_is_creator_clotured(incident, @users, @responses).deliver_now
        unless incident.tech_id.nil?
          AppMailer.incident_clotured_for_tech_if_is_creator_clotured(incident, @users).deliver_now
        end
        AppMailer.incident_clotured_for_disp_if_is_creator_clotured(incident, @users).deliver_now
      end
    end
  end
end

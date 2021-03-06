class AppMailer < ApplicationMailer
  before_filter :test_connection
  # Uncomment cc for receive all sended emails in copy.
  default from: 'ticket@cle-expertises.fr'
  # cc: 'ticket@cle-expertises.fr'
  def incident_created_for_disp(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.joins(:type_user).where('type_users.is_tech=1').pluck(:email).join(', ').to_s,
         subject: "Un incident a été créé par : #{incident.user.name} #{incident.user.surname}.",
         template_path: '/appmailer', template_name: 'incident_created_for_disp')
  end

  def incident_created_for_creator(incident, users)
    @incident = incident
    @users = users
    mail(to: incident.user.email.to_s, subject: 'Vous avez créé un incident.',
         template_path: '/appmailer', template_name: 'incident_created_for_creator')
  end

  def incident_replied_for_sender(incident, users, response)
    @incident = incident
    @users = users
    @response = response
    mail(to: @@users.where(id: response.sender_id).pluck(:email).join('').to_s, subject: "Vous avez répondu à l'incident n°#{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_replied_for_sender')
  end

  def incident_replied_for_receiver(incident, users, response)
    @incident = incident
    @users = users
    @response = response
    mail(to: @users.where(id: incident.tech_id).pluck(:email).join('').to_s, subject: "Vous avez reçu une réponse liée à l'incident n°#{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_replied_for_receiver')
  end

  def incident_replied_for_disp(incident, users, response)
    @incident = incident
    @users = users
    @response = response
    mail(to: @users.joins(:type_user).where('type_users.is_tech=1').pluck(:email).join(', ').to_s,
         subject: "Une réponse a été envoyé par : #{@users.where(id: response.sender_id).pluck(:name, :surname).join(' ')} pour l'incident n°#{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_replied_for_disp')
  end

  def incident_replied_for_disp_if_disp_answered(incident, users, response)
    @incident = incident
    @users = users
    @response = response
    mail(to: @users.where(id: response.sender_id).pluck(:email).join('').to_s, subject: "Vous avez répondu à l'incident n°#{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_replied_for_disp_if_disp_answered')
  end

  def incident_replied_for_tech_if_disp_answered(incident, users, response)
    @incident = incident
    @users = users
    @response = response
    mail(to: @users.where(id: incident.tech_id).pluck(:email).join('').to_s, subject: "Vous avez reçu une réponse liée à l'incident n°#{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_replied_for_tech_if_disp_answered')
  end

  def incident_replied_for_creator_if_disp_answered(incident, users, response)
    @incident = incident
    @users = users
    @response = response
    mail(to: incident.user.email.to_s,
         subject: "Vous avez reçu une réponse liée à l'incident n°#{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_replied_for_creator_if_disp_answered')
  end

  def incident_affected_for_tech(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.where(id: incident.tech_id).pluck(:email).join('').to_s, subject: 'Un incident vous a été affecté.',
         template_path: '/appmailer', template_name: 'incident_affected_for_tech')
  end

  def incident_affected_for_disp(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.joins(:type_user).where('type_users.is_tech=1').pluck(:email).join(', ').to_s,
         subject: "Vous venez d'affecter un incident.",
         template_path: '/appmailer', template_name: 'incident_affected_for_disp')
  end

  def incident_affected_for_creator(incident, users)
    @incident = incident
    @users = users
    mail(to: incident.user.email.to_s, subject: "Votre incident vient d'être affecté a un technicien.",
         template_path: '/appmailer', template_name: 'incident_affected_for_creator')
  end

  def incident_rejected_for_disp(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.joins(:type_user).where('type_users.is_tech=1').pluck(:email).join(', ').to_s,
         subject: "L'incident n°#{incident.id} a été rejeté.",
         template_path: '/appmailer', template_name: 'incident_rejected_for_disp')
  end

  def incident_rejected_for_creator(incident, users)
    @incident = incident
    @users = users
    mail(to: incident.user.email.to_s,
         subject: "Votre incident n°#{incident.id} a été rejeté.",
         template_path: '/appmailer', template_name: 'incident_rejected_for_creator')
  end

  def incident_clotured_for_disp_if_is_tech_clotured(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.joins(:type_user).where('type_users.is_tech=1').pluck(:email).join(', ').to_s,
         subject: "Demande de cloture faite par le technicien #{@users.where(id: incident.tech_id).pluck(:name, :surname).join(' ')} pour l'incident n°#{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_clotured_for_disp_if_is_tech_clotured')
  end

  def incident_clotured_for_tech_if_is_tech_clotured(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.joins(:type_user).where('type_users.is_tech=1').pluck(:email).join(', ').to_s,
         subject: "Vous avez envoyé une demande de cloture pour l'incident n°#{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_clotured_for_tech_if_is_tech_clotured')
  end

  def incident_clotured_for_creator_if_is_tech_clotured(incident, users, responses)
    @incident = incident
    @users = users
    @responses = responses
    mail(to: incident.user.email.to_s,
         subject: "Le technicien vous a envoyé une demande de cloture pour l'incident #{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_clotured_for_creator_if_is_tech_clotured')
  end

  def incident_clotured_for_disp_if_is_creator_clotured(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.joins(:type_user).where('type_users.is_tech=1').pluck(:email).join(', ').to_s,
         subject: "L'incident n°#{incident.id} a été cloturé par son créateur.",
         template_path: '/appmailer', template_name: 'incident_clotured_for_disp_if_is_creator_clotured')
  end

  def incident_clotured_for_tech_if_is_creator_clotured(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.where(id: incident.tech_id).pluck(:email).join('').to_s,
         subject: "L'incident n°#{incident.id} a été cloturé par son créateur.",
         template_path: '/appmailer', template_name: 'incident_clotured_for_tech_if_is_creator_clotured')
  end

  def incident_clotured_for_creator_if_is_creator_clotured(incident, users, responses)
    @incident = incident
    @users = users
    @responses = responses
    mail(to: incident.user.email.to_s,
         subject: "Vous avez cloturé l'incident n°#{incident.id}.",
         template_path: '/appmailer', template_name: 'incident_clotured_for_creator_if_is_creator_clotured')
  end

  def incident_reaffected_for_tech(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.where(id: incident.tech_id).pluck(:email).join('').to_s, subject: "Votre demande de réaffectation vient d'être envoyée",
         template_path: '/appmailer', template_name: 'incident_reaffected_for_tech')
  end

  def incident_reaffected_for_disp(incident, users)
    @incident = incident
    @users = users
    mail(to: @users.joins(:type_user).where('type_users.is_tech=1').pluck(:email).join(', ').to_s,
         subject: "Demande de réaffectation pour l'incident n°#{incident.id}",
         template_path: '/appmailer', template_name: 'incident_reaffected_for_disp')
  end

  def pseudonyme_forgeted(user)
    @user = user
    mail(to: user.email.to_s,
         subject: "Demande d'oubli de pseudonyme",
         template_path: '/appmailer', template_name: 'pseudonyme_forgeted')
  end

  private

  def test_connection
    return true if smtp = Net::SMTP.start('auth.smtp.1and1.fr', 587)
    smtp.finish
  end
end

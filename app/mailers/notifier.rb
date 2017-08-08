class Notifier < ActionMailer::Base
  default from: 'ticket@cle-expertises.fr'

  def deliver_password_reset_instructions(user)
    @edit_password_reset_url = edit_password_reset_url(user.perishable_token)
    mail(to: user.email, subject: 'Changement du mot de passe',
         template_path: '/notifier', template_name: 'password_reset_instructions')
  end
end

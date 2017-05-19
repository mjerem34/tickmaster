# create_user.rb
class CreateUser
  attr_accessor :result, :status, :user
  def initialize(params:, current_user:)
    @params = params
    @result = "Impossible de créer l'utilisateur"
    @status = 422
    @current_user = current_user
  end

  def call
    puts @params.inspect
    @user = User.new(@params)
    if !@current_user.nil? && @current_user.can?('create_new_tech') ||
       @user.type_user.is_tech
      create_user
    else
      @result = "Vous n'avez pas l'autorisation pour faire cela"
      @status = 403
    end
    self
  end

  private

  def create_user
    return unless @user.save
    @result = 'Utilisateur créé'
    @status = 201
    send_notif
  end

  def send_notif
    msg = @user.name + ' ' + @user.surname + " vient de s'inscrire !"
    User.joins(:type_user).where('type_users.is_tech=1').each do |tech|
      next if tech.ip_addr.blank?
      SendNotification.new(host: tech.ip_addr, msg: msg).call
    end
  end
end

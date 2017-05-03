# A suit of methods to use in all the app
module ApplicationHelper
  include SessionsHelper
  include AgenciesHelper

  def restrict_access
    return access_unauthorized if current_user.nil?
    verify_right("#{action_name}_#{controller_name}") ? nil : permission_denied
  end

  def verify_right(right_name)
    instance_variable_set("@#{right_name}", current_user.can?(right_name))
  end

  private

  def permission_denied
    respond_to do |format|
      format.json { render json: nil, status: 403 }
      format.html do
        redirect_to '/',
                    alert: "Vous n'êtes pas autorisé à faire cela."
      end
    end
  end

  def access_unauthorized
    respond_to do |format|
      format.json { render json: nil, status: 401 }
      format.html do
        redirect_to '/',
                    alert: 'Vous devez être connecté pour accéder à cette/'
        ' ressource'
      end
    end
  end
end

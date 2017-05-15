# rights_controller.rb
class RightsController < ApplicationController
  before_action :set_expiration
  before_action :restrict_access

  # GET /rights
  # GET /rights.json
  # Should render all the rights on a list.
  def index
    @rights = Right.all
    @type_users = TypeUser.all
    respond_to do |format|
      format.json { render json: @rights }
      format.html { render :index }
    end
  end

  # GET /rights/1.json
  # Should render one right (by id passed in params)
  # and the type_users associated
  def show
    @right = Right.find(params[:id])
    respond_to do |format|
      format.json { render json: @right.type_user_rights }
      format.html { redirect_to rights_path }
    end
  end
end

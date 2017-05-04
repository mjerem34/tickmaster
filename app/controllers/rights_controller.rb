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

  # POST /rights/check_uncheck_right.json
  # TODO : Do the thing in type_users
  def check_uncheck_right
    @edit_rights = verify_right('edit_rights')
    if @edit_rights
      if !params[:checked].blank? && !params[:type_user].blank? && !params[:right].blank?
        if !params[:checked] === true || !params[:checked] === false
          if TypeUserRight.where(right_id: params[:right], type_user_id: params[:type_user]).first.update(value: params[:checked])
            respond_to { |format| format.json { head :no_content } }
          else
            respond_to { |format| format.json { render json: nil, status: 422 } }
          end
        end
      else
        respond_to { |format| format.json { render json: nil, status: 422 } }
      end
    else
      permission_denied
    end
  end

  # GET /rights/1.json
  # Should render one right (by id passed in params)
  # and the type_users associated
  def show
    @right = Right.find(params[:id])
    respond_to do |format|
      format.json { render json: @right }
      format.html { redirect_to :back }
    end
  end

  private

  def right_params
    params.require(:right).permit(:name, :content)
  end
end

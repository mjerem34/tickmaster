class RightsController < ApplicationController
  before_action :set_expiration
  before_action :restrict_access

  # GET /rights
  # GET /rights.json
  # Should render all the rights on a list.
  def index
    @view_index_rights = verifRight('view_index_rights')
    if @view_index_rights
      @edit_rights = verifRight('edit_rights')
      @title = 'Liste des droits'
      @rights = Right.all
      @type_users = TypeUser.all
      # puts '------------------'
      # puts @type_users
      # puts '------------------'
      respond_to do |format|
        format.json { render json: @rights }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # POST /rights/check_uncheck_right.json
  def check_uncheck_right
    @edit_rights = verifRight('edit_rights')
    if @edit_rights
      if !params[:checked].blank? && !params[:type_user].blank? && !params[:right].blank?
        if !params[:checked] === true || !params[:checked] === false
          if TypeUserRight.where(right_id: params[:right], type_user_id: params[:type_user]).first.update(value: params[:checked])
            respond_to { |format| format.json { head :no_content } }
          else
            respond_to { |format| format.json { render json: nil, status: :unprocessable_entity } }
          end
        end
      else
        respond_to { |format| format.json { render json: nil, status: :unprocessable_entity } }
      end
    else
      renderUnauthorized
    end
  end

  # GET /rights/1.json
  # Should render one right (by id passed in params)
  def show
    @edit_rights = verifRight('edit_rights')
    @right = Right.find(params[:id])
    if @edit_rights
      @title = "Droit : #{@right.name}"
      respond_to do |format|
        format.json { render json: @right }
        format.html { redirect_to_back }
      end
    else
      renderUnauthorized
    end
  end

  private

  def right_params
    params.require(:right).permit(:name, :content)
  end
end

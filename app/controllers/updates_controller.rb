class UpdatesController < ApplicationController
  before_action :set_update, only: %i[show edit update destroy]
  
  before_action :restrict_access

  # GET /updates
  # GET /updates.json
  def index
    @view_update = verify_right('view_update')
    if @view_update
      @title = 'Liste des mises à jour'
      @updates = Update.all
      respond_to do |format|
        format.json { render json: @updates }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end

  # GET /updates/1
  # GET /updates/1.json
  def show
    @view_update = verify_right('view_update')
    if @view_update
      @title = "Mise à jour numéro : #{@update.id}"
      respond_to do |format|
        format.json { render json: @update }
        format.html { render :show }
      end
    else
      permission_denied
    end
  end

  # GET /updates/new
  def new
    @create_update = verify_right('create_update')
    if @create_update
      @title = 'Nouvelle mise à jour'
      @update = Update.new
    else
      permission_denied
    end
  end

  # GET /updates/1/edit
  def edit
    @modify_update = verify_right('modify_update')
    if @modify_update
      @title = "Mise à jour numéro : #{@update.id}"
      respond_to :html
    else
      permission_denied
    end
  end

  # POST /updates
  # POST /updates.json
  def create
    @create_update = verify_right('create_update')
    if @create_update
      @update = Update.new(update_params)
      respond_to do |format|
        if @update.save
          @users = User.all
          @users.each do |user|
            user.update(maj: true)
          end
          format.json { render json: @update.id, status: :created }
          format.html { redirect_to @update, notice: 'La mise à jour a été crée, et grâce à toi BG !' }
        else
          format.json { render json: @update.errors.full_messages, status: 422 }
          format.html { render :new, notice: "Impossible de créer la mise à jour : #{@update.errors}" }
        end
      end
    else
      permission_denied
    end
  end

  # PATCH/PUT /updates/1
  # PATCH/PUT /updates/1.json
  def update
    @modify_update = verify_right('modify_update')
    if @modify_update
      respond_to do |format|
        if @update.update(update_params)
          format.json { head :no_content }
          format.html { redirect_to @update, notice: 'La mise à jour a bien été editée' }
        else
          format.json { render json: @update.errors.full_messages, status: 422 }
          format.html { render :edit, notice: "Impossible d'éditer la mise à jour : #{@update.errors}" }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /updates/1
  # DELETE /updates/1.json
  def destroy
    @delete_update = verify_right('delete_update')
    if @delete_update
      respond_to do |format|
        if @update.destroy
          format.json { head :no_content }
          format.html { redirect_to updates_url, notice: 'Mise à jour supprimée !' }
        else
          format.json { render json: 'Impossible de supprimer la mise à jour !', status: 422 }
          format.html { redirect_to updates_url, notice: 'Impossible de supprimer la mise à jour !' }
        end
      end
    else
      permission_denied
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_update
    @update = Update.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def update_params
    params.require(:update).permit(:changesMade)
  end
end

class RightsController < ApplicationController
  before_action :set_right, only: [:show, :edit, :update, :destroy]
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
      @right = Right.new
      respond_to do |format|
        format.json { render json: @rights }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # GET /rights/1
  # GET /rights/1.json
  # Should render one right (by id passed in params)
  def show
    @edit_rights = verifRight('edit_rights')
    if @edit_rights
      @title = "Droit : #{@right.name}"
      respond_to do |format|
        format.json { render json: @right }
        format.html { redirect_to :edit }
      end
    else
      renderUnauthorized
    end
  end

  # GET /rights/new
  # Should render the new form, this is only for web.
  def new
    @create_new_right = verifRight('create_new_right')
    if @create_new_right
      @title = 'Nouveau droit'
      @right = Right.new
    else
      renderUnauthorized
    end
  end

  # GET /rights/1/edit
  # Should render the edit form, this is only for web.
  # Need to pass the id of the right in params(id).
  def edit
    @edit_rights = verifRight('edit_rights')
    if @edit_rights
      @title = "Editer droit : #{@right.name}"
      respond_to do |format|
        format.html { render :edit }
      end
    else
      renderUnauthorized
    end
  end

  # POST /rights
  # POST /rights.json
  # Should create a right but it is useless
  # Because a right need to be implemented in the code. Thanks to the genius that
  # Coded that fucking app. Thanks !!
  def create
    @create_new_right = verifRight('create_new_right')
    if @create_new_right
      @right = Right.new(right_params)
      respond_to do |format|
        if @right.save && !@right.name.nil? && !@right.content.nil?
          format.json { render json: @right.id, status: :created }
          format.html { redirect_to rights_url, notice: 'Droit créé.' }
        else
          format.json { render json: @right.errors, status: :unprocessable_entity }
          format.html { redirect_to new_right_path, notice: 'Veuillez entrer un nom et/ou une description du droit.' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /rights/1
  # PATCH/PUT /rights/1.json
  # Should update the params of the right passed in params.
  def update
    @edit_rights = verifRight('edit_rights')
    if @edit_rights
      respond_to do |format|
        if @right.update(right_params)
          format.json { render json: nil, status: :ok }
          format.html { redirect_to rights_path, notice: 'Droit mis à jour.' }
        else
          format.json { render json: @right.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: "Impossible de modifier le droit : #{@right.errors}" }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /rights/1
  # DELETE /rights/1.json
  # Should delete the right passed in params, but no right could be deleted.
  # Why ? Because it is implemented in the code ... Thanks to the dev ...
  def destroy
    @delete_rights = verifRight('delete_rights')
    if @delete_rights
      respond_to do |format|
        if @right.destroy
          format.json { head :no_content }
          format.html { redirect_to rights_url, notice: 'Droit supprimé.' }
        else
          format.json { head json: 'Impossible de supprimer le droit', status: 409 }
          format.html { redirect_to rights_url, notice: 'Impossible de supprimer le droit' }
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  def set_right
    @right = Right.find(params[:id])
  end

  def right_params
    params.require(:right).permit(:name, :content, :user, :tech, :super_tech, :admin, :disp, :assistant, :expert, :comptable)
  end
end

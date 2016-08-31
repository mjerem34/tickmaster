class MaterialsController < ApplicationController
  before_action :restrict_access
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration

  # GET /materials
  # GET /materials.json
  # Should render all the materials.
  def index
    @view_material = verifRight('view_material')
    if @view_material
      @title = 'Matériels'
      @materials = Material.all
      respond_to do |format|
        format.json { render json: @materials }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  # GET /materials/1
  # GET /materials/1.json
  # Should render specs of one material.
  def show
    @view_material = verifRight('view_material')
    if @view_material
      @title = "Matériel n° #{@material.id}"
      respond_to do |format|
        format.json { render json: @material }
        format.html { render :show }
      end
    else
      renderUnauthorized
    end
  end

  # GET /materials/new
  def new
    @create_material = verifRight('create_material')
    if @create_material
      @title = 'Nouveau Matériel'
      @material = Material.new
    else
      renderUnauthorized
    end
  end

  # GET /materials/1/edit
  def edit
    @modify_material = verifRight('modify_material')
    if @modify_material
      @title = 'Editer matériel'
    else
      renderUnauthorized
    end
  end

  # POST /materials
  # POST /materials.json
  def create
    @create_material = verifRight('create_material')
    if @create_material
      @title = 'Nouveau Matériel'
      @material = Material.new(material_params)
      respond_to do |format|
        if @material.save
          format.json { render json: @material.id }
          format.html { redirect_to @material, notice: 'Le matériel a bien été créé.' }
        else
          format.json { render json: @material.errors, status: :unprocessable_entity }
          format.html { render :new, notice: 'Impossible de créer le matériel.' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    if verifRight('modify_material')
      respond_to do |format|
        if @material.update(material_params)
          format.json { head :no_content }
          format.html { redirect_to @material, notice: 'Le matériel a bien été mis à jour.' }
        else
          format.json { render json: @material.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de modifier ce matériel ... Dommage !' }
        end
      end
    else
      renderUnauthorized
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    if verifRight('delete_material')
      respond_to do |format|
        if @material.destroy
          format.json { head :no_content }
          format.html { redirect_to materials_url, notice: 'Matériel supprimé.' }
        else
          format.json { render json: @material.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de supprimer ce matériel.' }
        end
      end
    else
      renderUnauthorized
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_material
    @material = Material.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def material_params
    params.require(:material).permit(:type_material_id, :detentor_type_id, :detentor_id, :seller_id, :date)
  end
end

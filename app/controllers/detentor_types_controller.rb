class DetentorTypesController < ApplicationController
  before_action :set_detentor_type, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /detentor_types
  # GET /detentor_types.json
  def index
    # TODO: verifRight.
    @title = "Types de détenteurs"
    @detentor_types = DetentorType.all
    respond_to do |format|
      format.json { render json: @detentor_types }
      format.html { render :index}
    end
  end

  # GET /detentor_types/1
  # GET /detentor_types/1.json
  def show
    @title = "Type de détenteur"
    # TODO: verifRight.
    respond_to do |format|
      format.json { render json: @detentor_type }
      format.html { render :show }
    end
  end

  # GET /detentor_types/new
  def new
    # TODO: verifRight.
    @detentor_type = DetentorType.new
    @title = "Nouveau type de détenteur"
  end

  # GET /detentor_types/1/edit
  def edit
    # TODO: verifRight.

    @title = "Editer type de détenteur"
  end

  # POST /detentor_types
  # POST /detentor_types.json
  def create
    # TODO: verifRight.

    @title = "Nouveau type de détenteur"
    @detentor_type = DetentorType.new(detentor_type_params)
    respond_to do |format|
      if @detentor_type.save
        format.json { render @detentor_type.id, status: :created }
        format.html { redirect_to @detentor_type, notice: 'Le type de détenteur a bien été créé.' }
      else
        format.json { render json: @detentor_type.errors, status: :unprocessable_entity }
        format.html { render :new, notice: 'Impossible de créer ce type de détenteur.' }
      end
    end
  end

  # PATCH/PUT /detentor_types/1
  # PATCH/PUT /detentor_types/1.json
  def update
    # TODO: verifRight.

    respond_to do |format|
      if @detentor_type.update(detentor_type_params)
        format.json { render :show, status: :ok, location: @detentor_type }
        format.html { redirect_to @detentor_type, notice: 'Le type de détenteur à bien été mis à jour.' }
      else
        format.json { render json: @detentor_type.errors, status: :unprocessable_entity }
        format.html { render :edit, notice: 'Impossible de modifier ce type de détenteur.' }
      end
    end
  end

  # DELETE /detentor_types/1
  # DELETE /detentor_types/1.json
  def destroy
    # TODO: verifRight.

    respond_to do |format|
      if @detentor_type.destroy
        format.json { head :no_content }
        format.html { redirect_to detentor_types_url, notice: 'Le type de détenteur à bien été supprimé.' }
      else
        format.json { render json: @detentor_type.errors, status: :unprocessable_entity }
        format.html { redirect_to @detentor_type, notice: 'Impossible de supprimer le type de détenteur.' }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_detentor_type
    @detentor_type = DetentorType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def detentor_type_params
    params.require(:detentor_type).permit(:name)
  end
end

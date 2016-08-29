class DetentorTypesController < ApplicationController
  before_action :set_detentor_type, only: [:show, :edit, :update, :destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /detentor_types
  # GET /detentor_types.json
  def index
    @title = "Types de détenteurs"
    @detentor_types = DetentorType.all
  end

  # GET /detentor_types/1
  # GET /detentor_types/1.json
  def show
    @title = "Type de détenteur"
  end

  # GET /detentor_types/new
  def new
    @detentor_type = DetentorType.new
    @title = "Nouveau type de détenteur"
  end

  # GET /detentor_types/1/edit
  def edit
    @title = "Editer type de détenteur"
  end

  # POST /detentor_types
  # POST /detentor_types.json
  def create
    @detentor_type = DetentorType.new(detentor_type_params)

    respond_to do |format|
      if @detentor_type.save
        format.json { render :show, status: :created, location: @detentor_type }
        format.html { redirect_to @detentor_type, notice: 'Detentor type was successfully created.' }
      else
        format.json { render json: @detentor_type.errors, status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /detentor_types/1
  # PATCH/PUT /detentor_types/1.json
  def update
    respond_to do |format|
      if @detentor_type.update(detentor_type_params)
        format.html { redirect_to @detentor_type, notice: 'Detentor type was successfully updated.' }
        format.json { render :show, status: :ok, location: @detentor_type }
      else
        format.html { render :edit }
        format.json { render json: @detentor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detentor_types/1
  # DELETE /detentor_types/1.json
  def destroy
    @detentor_type.destroy
    respond_to do |format|
      format.html { redirect_to detentor_types_url, notice: 'Detentor type was successfully destroyed.' }
      format.json { head :no_content }
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

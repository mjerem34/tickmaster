class TechesController < ApplicationController
  before_action :set_tech, only: [:show, :edit, :update, :destroy]

  # GET /teches
  # GET /teches.json
  def index
    @teches = Tech.all
  end

  # GET /teches/1
  # GET /teches/1.json
  def show
  end

  # GET /teches/new
  def new
    @tech = Tech.new
  end

  # GET /teches/1/edit
  def edit
  end

  # POST /teches
  # POST /teches.json
  def create
    @tech = Tech.new(tech_params)

    respond_to do |format|
      if @tech.save
        format.html { redirect_to @tech, notice: 'Tech was successfully created.' }
        format.json { render :show, status: :created, location: @tech }
      else
        format.html { render :new }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teches/1
  # PATCH/PUT /teches/1.json
  def update
    respond_to do |format|
      if @tech.update(tech_params)
        format.html { redirect_to @tech, notice: 'Tech was successfully updated.' }
        format.json { render :show, status: :ok, location: @tech }
      else
        format.html { render :edit }
        format.json { render json: @tech.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teches/1
  # DELETE /teches/1.json
  def destroy
    @tech.destroy
    respond_to do |format|
      format.html { redirect_to teches_url, notice: 'Tech was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tech
      @tech = Tech.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tech_params
      params.require(:tech).permit(:name, :afficher, :simple_user)
    end
end

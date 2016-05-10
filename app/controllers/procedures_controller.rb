class ProceduresController < ApplicationController
  before_action :set_procedure, only: [:show, :edit, :update, :destroy]
  before_action :set_categories_all, only: [:index, :show, :edit, :new, :create]


  # GET /procedures
  # GET /procedures.json
  def index
    @procedures = Procedure.all
  end

  # GET /procedures/1
  # GET /procedures/1.json
  def show
  end

  # GET /procedures/new
  def new
    @procedure = Procedure.new
    @nom = params[:nom]
    @contenu = params[:contenu]
    @messages = params[:messages]
    @category_id = params[:category_id]
    @sous_category_id = params[:sous_category_id]
    if @category_id.nil?
      @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
    else
      @sous_categories = SousCategory.where('category_id = ?', @category_id)
    end

  end

  def update_subcats
    @sous_categories = SousCategory.where('category_id = ?',
                                          params[:category_id])
    respond_to do |format|
      format.js
    end
  end

  # GET /procedures/1/edit
  def edit
  end

  # POST /procedures
  # POST /procedures.json
  def create
    @procedure = Procedure.new(procedure_params)
    respond_to do |format|
      if @procedure.save
        unless params[:file_procedures].nil?
          params[:file_procedures]['file'].each do |a|
            @file_procedure = @procedure.file_procedures.create!(
              procedure_id: @procedure.id,
              file: a
            )
          end
        end
        format.html { redirect_to @procedure, notice: 'Procedure was successfully created.' }
        format.json { render :show, status: :created, location: @procedure }
      else
        format.html { render :new }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procedures/1
  # PATCH/PUT /procedures/1.json
  def update
    respond_to do |format|
      if @procedure.update(procedure_params)
        format.html { redirect_to @procedure, notice: 'Procedure was successfully updated.' }
        format.json { render :show, status: :ok, location: @procedure }
      else
        format.html { render :edit }
        format.json { render json: @procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procedures/1
  # DELETE /procedures/1.json
  def destroy
    @procedure.destroy
    respond_to do |format|
      format.html { redirect_to procedures_url, notice: 'Procedure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def download
    send_file "#{Rails.root}/public/uploads/procedures/#{@procedure.file_procedure.id}/#{@procedure.file_procedure.identifier}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procedure
      @procedure = Procedure.find(params[:id])
    end

    def set_categories_all
      @categories = Category.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def procedure_params
      params.require(:procedure).permit(
      :nom, :contenu, :resolution, :category_id,
      :sous_category_id,
      file_procedures_attributes: [:file])
    end
end

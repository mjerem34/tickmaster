class MsgProceduresController < ApplicationController
  before_action :set_msg_procedure, only: [:show, :edit, :update, :destroy]

  # GET /msg_procedures
  # GET /msg_procedures.json
  def index
    @msg_procedures = MsgProcedure.all
  end

  # GET /msg_procedures/1
  # GET /msg_procedures/1.json
  def show
  end

  # GET /msg_procedures/new
  def new
    @msg_procedure = MsgProcedure.new
  end

  # GET /msg_procedures/1/edit
  def edit
  end

  # POST /msg_procedures
  # POST /msg_procedures.json
  def create
    @msg_procedure = MsgProcedure.new(msg_procedure_params)

    respond_to do |format|
      if @msg_procedure.save
        format.html { redirect_to @msg_procedure, notice: 'Msg procedure was successfully created.' }
        format.json { render :show, status: :created, location: @msg_procedure }
      else
        format.html { render :new }
        format.json { render json: @msg_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /msg_procedures/1
  # PATCH/PUT /msg_procedures/1.json
  def update
    respond_to do |format|
      if @msg_procedure.update(msg_procedure_params)
        format.html { redirect_to @msg_procedure, notice: 'Msg procedure was successfully updated.' }
        format.json { render :show, status: :ok, location: @msg_procedure }
      else
        format.html { render :edit }
        format.json { render json: @msg_procedure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /msg_procedures/1
  # DELETE /msg_procedures/1.json
  def destroy
    @msg_procedure.destroy
    respond_to do |format|
      format.html { redirect_to msg_procedures_url, notice: 'Msg procedure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_msg_procedure
      @msg_procedure = MsgProcedure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def msg_procedure_params
      params.require(:msg_procedure).permit(:id_procedures, :contenu)
    end
end

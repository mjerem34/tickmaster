class ProceduresController < ApplicationController
  before_action :set_procedure, only: %i[show edit update destroy]
  before_action :set_categories_all, only: %i[index show edit new create]
  
  before_action :restrict_access
  # GET /procedures
  # GET /procedures.json
  # Should get and return all the procedures.
  def index
    @view_procedures = verify_right('view_procedures')
    if @view_procedures
      @title = 'Liste des procedures'
      @procedures = Procedure.all.reorder('created_at asc')
      @edit_procedure = verify_right('edit_procedure')
      respond_to do |format|
        format.json { render json: @procedures }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end

  # GET /procedures/1
  # GET /procedures/1.json
  # Get and returns one procedure by params passed.
  def show
    @view_procedures = verify_right('view_procedures')
    if @view_procedures
      @title = 'Procedure N° ' + @procedure.id.to_s
      respond_to do |format|
        format.json { render json: @procedure }
        format.html { render :show }
      end
    else
      permission_denied
    end
  end

  # GET /procedures/new
  # Only used for web.
  # Should render new form.
  # It get the param 'nom', 'contenu', 'messages' passed by an incident.
  # You understand ? Incident => Procedure = DRY.
  def new
    @create_procedure = verify_right('create_procedure')
    if @create_procedure
      @title = 'Nouvelle procedure'
      @procedure = Procedure.new
      @nom = params[:nom]
      @contenu = params[:contenu]
      unless params[:messages].nil?
        @messages = params[:messages]
        @a = ''
        i = 0
        msg = @messages.split(';;')
        msg = msg.each do |m|
          i += 1
          @a = @a + '<h4><b><u>Message N° ' + i.to_s + ' : </u></b><h4>' + m + '<br>'
        end
      end
      @category_id = params[:category_id]
      @sous_category_id = params[:sous_category_id]
      if @category_id.nil?
        @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
      else
        @sous_categories = SousCategory.where('category_id = ?', @category_id)
      end
    else
      permission_denied
    end
  end

  # This is the method for update the list of the subcatecories when
  # We want to create an procedure.
  # It do the job in ajax, when the user change the category selected.
  def update_subcats
    @sous_categories = SousCategory.where('category_id = ?',
                                          params[:category_id])
    respond_to do |format|
      format.js
    end
  end

  # GET /procedures/1/edit
  # Should render the edit form, for... edit an procedure !!
  def edit
    @edit_procedure = verify_right('edit_procedure')
    if @edit_procedure
      @title = 'Procedure N° ' + @procedure.id.to_s
      @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
    else
      permission_denied
    end
  end

  # POST /procedures
  # POST /procedures.json
  # Should create an procedure, with files et cetera...
  def create
    @create_procedure = verify_right('create_procedure')
    if @create_procedure
      @procedure = Procedure.new(procedure_params)
      respond_to do |format|
        if @procedure.save
          # If there are files, it saves it here.
          unless params[:file_procedures].nil?
            params[:file_procedures]['file'].each do |a|
              @file_procedure = @procedure.file_procedures.create!(
                procedure_id: @procedure.id,
                file: a
              )
            end
          end
          format.json { render json: @procedure.id, status: :created }
          format.html { redirect_to @procedure, notice: 'La procedure a été créée.' }
        else
          format.json { render json: @procedure.errors.full_messages, status: 422 }
          format.html { redirect_to :back, notice: 'Impossible de créer la procedure.' + @procedure.errors }
        end
      end
    else
      permission_denied
    end
  end

  # PATCH/PUT /procedures/1
  # PATCH/PUT /procedures/1.json
  # Update the params of the procedure passed in params.
  def update
    @edit_procedure = verify_right('edit_procedure')
    if @edit_procedure
      respond_to do |format|
        if @procedure.update(procedure_params)
          format.json { head :no_content }
          format.html { redirect_to @procedure, notice: 'La procedure a été mise a jour.' }
        else
          format.json { render json: @procedure.errors.full_messages, status: 422 }
          format.html { redirect_to :back, notice: 'Impossible de modifier la procedure' }
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /procedures/1
  # DELETE /procedures/1.json
  # Should destroy the procedure selected.
  def destroy
    @delete_procedure = verify_right('delete_procedure')
    if @delete_procedure
      respond_to do |format|
        if @procedure.destroy
          format.json { head :no_content }
          format.html { redirect_to procedures_url, notice: 'La procedure a été supprimée.' }
        else
          format.json { render json: @procedure.errors.full_messages, status: 422 }
          format.html { redirect_to :back, notice: "Impossible de supprimer la procedure. #{@procedure.errors}" }
        end
      end
    else
      permission_denied
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
      file_procedures_attributes: [:file]
    )
  end
end

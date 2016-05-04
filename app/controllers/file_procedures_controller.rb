class FilesProceduresController < ApplicationController
  def create
    @file = FileProcedure.new(file_procedure_params)
    @file.save!
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def file_procedure_params
      params.require(:file_procedure).permit(:procedure_id, :file)
    end

end

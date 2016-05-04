class FilesMsgProcedureController < ApplicationController
  def create
    @file = FilesMsgProcedure.new(msg_procedure_id: @msg_procedure.id, file: @msg_procedure.params[:file])
    @file.save
  end
end

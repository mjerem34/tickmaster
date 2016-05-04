class FilesProceduresController < ApplicationController
  def create
    @file = FileProcedure.new()
    @file.save!
  end
end

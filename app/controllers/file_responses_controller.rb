class FilesResponsesController < ApplicationController
  def create
    @file = FileResponse.new(file_response_params)
    @file.save
  end
end

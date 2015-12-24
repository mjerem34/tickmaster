class FilesArchivesController < ApplicationController
  def create
    @file = FileArchive.new(file_archive_params)
    @file.save
  end
end

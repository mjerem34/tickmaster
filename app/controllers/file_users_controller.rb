class FilesUsersController < ApplicationController
  def create
    @file = FileUser.new(file_user_params)
    @file.save
  end
end

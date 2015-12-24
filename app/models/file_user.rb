class FileUser < ActiveRecord::Base
  belongs_to :user

  mount_uploader :file, FileUsersUploader
  before_save :save_file_attribute

  def save_file_attribute
    if file.present?
      self.content_type = file.content_type
      self.file_size = file.file.size
    end
  end

end

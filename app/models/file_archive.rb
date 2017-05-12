class FileArchive < ActiveRecord::Base
  belongs_to :archive

  mount_uploader :file, FileArchivesUploader
  before_save :save_file_attribute
  def save_file_attribute
    if file.present?
      self.content_type = file.content_type
      self.file_size = file.file.size
    end
  end
end

class FileResponse < ActiveRecord::Base
  belongs_to :response

  mount_uploader :file, FileResponsesUploader
  before_save :save_file_attribute

  def save_file_attribute
    if file.present?
      self.content_type = file.content_type
      self.file_size = file.file.size
    end
  end
end

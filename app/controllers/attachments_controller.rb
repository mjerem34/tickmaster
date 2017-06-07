# attachments_controller.rb
class AttachmentsController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  
  before_action :restrict_access, except: :destroy

  # post /attachments/upload.json
  def upload
    @attachment = Attachment.new
    @attachment.file = params[:file]
    puts @attachment.file.filename
    @attachment.save
    render json: { link: @attachment.file.url }, status: 200
  end

  # delete /attachements/destroy.json
  def destroy
    file_name = params[:file].split('/').last.split('?').first
    @attachment = Attachment.find_by(file: file_name).remove_file!

    render json: nil, status: 200
  end
end

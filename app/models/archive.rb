class Archive < ActiveRecord::Base
  belongs_to :user
  belongs_to :incident
  has_many :files_archives
  accepts_nested_attributes_for :files_archives, allow_destroy: true
end

class Update < ActiveRecord::Base
  validates :changes, presence: true
end

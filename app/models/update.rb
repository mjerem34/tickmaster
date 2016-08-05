class Update < ActiveRecord::Base
  validates :changesMade, presence: true
end

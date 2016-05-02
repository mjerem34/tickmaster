class MsgProcedure < ActiveRecord::Base
  belongs_to :procedure
  has_many :file_msg_procedure
  has_many :file_msg_procedures
  accepts_nested_attributes_for :file_msg_procedures

  validates :content, length: { in: 0..65535 }, presence: true
end

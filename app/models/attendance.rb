class Attendance < ApplicationRecord
    belongs_to :user
    belongs_to :event
    scope :present_status, ->(status) {where(status:status)}
end

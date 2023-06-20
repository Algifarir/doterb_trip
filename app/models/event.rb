class Event < ApplicationRecord
    mount_uploader :photo, ImageUploader
    has_many :attendances
    has_many :invitations
end

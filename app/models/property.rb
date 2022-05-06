class Property < ApplicationRecord
  # has_many_attached :images, dependent: :destroy
  include ImageUploader::Attachment(:image)
end

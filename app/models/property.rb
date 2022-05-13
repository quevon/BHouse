class Property < ApplicationRecord
  include ImageUploader::Attachment(:image)
end

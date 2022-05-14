class Property < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :property_tenants
  belongs_to :owner
  accepts_nested_attributes_for :property_tenants
end
 
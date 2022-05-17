class Property < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :property_tenants
  belongs_to :owner
  accepts_nested_attributes_for :property_tenants
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :location_lat,
                   :lng_column_name => :location_lng

  def calculated_advance_deposit
    self.deposit_advance * self.monthly_price
  end

  def calculated_security_deposit
    self.deposit_security * self.monthly_price
  end

  def total_first_bill
    monthly_price + calculated_advance_deposit + calculated_security_deposit
  end
end
 
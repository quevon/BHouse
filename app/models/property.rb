class Property < ApplicationRecord
  include ImageUploader::Attachment(:image)
  has_many :property_tenants
  has_many :likes
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

  def liked?(tenant)
    !!self.likes.find{|like| like.tenant_id == tenant.id}

  end

  def number_of_likes
    self.likes.count
  end

  def present_tenants
    self.property_tenants.where(:status => "approved")
  end

  def pending_tenants
    self.property_tenants.where(:status => "pending")
  end

end
 
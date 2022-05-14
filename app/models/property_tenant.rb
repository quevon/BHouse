class PropertyTenant < ApplicationRecord
  belongs_to :property
  belongs_to :tenant

  validate :check_for_duplicate_application
  validates :tenant_id, uniqueness: true

  def check_for_duplicate_application
    return unless self.tenant.property_tenants.where(:property_id => self.property_id).count < 0
  end
end

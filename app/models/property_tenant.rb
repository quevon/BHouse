class PropertyTenant < ApplicationRecord
  belongs_to :property
  belongs_to :tenant
  has_many :transactions

  # validate :check_for_duplicate_application
  validates :tenant_id, uniqueness: {scope: :property_id}

end

class Transaction < ApplicationRecord
  belongs_to :tenant
  belongs_to :owner
  belongs_to :property_tenant

  validates :tenant_id, presence: true
  validates :owner_id, presence: true
  validates :amount, presence:true, numericality: {:greater_than => 0}
  validates :property_tenant_id, presence: true
  validates :status, presence: true, inclusion: { in: ['Waiting for Payment', 'Paid'], message: "not valid"} 

  attr_accessor :current_tenant

  validate :check_tenant_balance, :if => :current_tenant
  before_save :update_balance, :if => :current_tenant
  after_save :update_status, :if => :current_tenant


def name
    "#{firstname} #{lastname}"
end

def check_tenant_balance
  if self.tenant.balance < self.amount
    errors.add(:amount, " required is greater than your available balance.")
  end
end

def update_balance
  return unless self.valid?
  self.tenant.balance -= self.amount
  self.tenant.save
  self.owner.balance += self.amount
  self.owner.save
end

def update_status
  self.update(:status => "Paid")
end

end

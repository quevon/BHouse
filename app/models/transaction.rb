class Transaction < ApplicationRecord
  belongs_to :tenant
  belongs_to :owner

  validate :check_sufficient_balance


def name
    "#{firstname} #{lastname}"
end

def check_sufficient_balance
  if self.tenant.balance < self.amount
    errors.add(:amount, "Insufficient balance for this amount")
  end
end

def update_balance
  self.tenant.balance -= self.amount
  if check_sufficient_balance && self.tenant.save
    self.owner.balance += self.amount
    self.owner.save
    self.update(:status => "Paid")
  else
    return self.errors
  end
end

end

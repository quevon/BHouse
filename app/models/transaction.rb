class Transaction < ApplicationRecord
  belongs_to :tenant
  belongs_to :owner

def name
    "#{firstname} #{lastname}"
  end
end

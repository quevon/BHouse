class Transaction < ApplicationRecord
  belongs_to :tenant
  belongs_to :owner
end

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'required fields' do
    it 'raise error when required fields are empty' do
        transaction = Transaction.new
        transaction.save
        expect(transaction).to_not be_valid
        expect(transaction.errors).to be_present
        expect(transaction.errors.to_hash.keys).to include(:owner, :tenant, :amount, :property_tenant)
        expect(transaction.errors[:owner]).to include("must exist")
        expect(transaction.errors[:tenant]).to include("must exist")
        expect(transaction.errors[:amount]).to include("can't be blank")
    end

    it 'raise error when amount is negative' do
      negative_amount = Transaction.create(amount: -1)
      expect(negative_amount).to_not be_valid
      expect(negative_amount.errors).to be_present
      expect(negative_amount.errors.to_hash.keys).to include(:amount)
      expect(negative_amount.errors[:amount]).to include("must be greater than 0")
    end

    # it 'rejects payment with insufficient tenant balance' do
    #   insufficient_balance = Transaction.create(amount: 10000)
    #   allow(insufficient_balance.tenant).to receive(:balance).and_return(2000)
    #   expect(insufficient_balance).to_not be_valid
    #   expect(insufficient_balance.errors).to be_present
    #   expect(insufficient_balance.errors.to_hash.keys).to include(:amount)
    #   expect(insufficient_balance.errors[:amount]).to include("must be greater than 0")
    # end
  end
end
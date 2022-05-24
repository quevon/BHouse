require 'rails_helper'

RSpec.describe PropertyTenant, type: :model do
    context 'required fields' do
        it 'raise error when required fields are empty' do
            property_tenant = PropertyTenant.new
            property_tenant.save
            expect(property_tenant).to_not be_valid
            expect(property_tenant.errors).to be_present
            expect(property_tenant.errors.to_hash.keys).to include(:property, :tenant)
            expect(property_tenant.errors[:property]).to include("must exist")
            expect(property_tenant.errors[:tenant]).to include("must exist")
        end
    end
end

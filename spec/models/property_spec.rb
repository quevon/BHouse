require 'rails_helper'

RSpec.describe Property, type: :model do
  context 'required fields' do
    it 'raise error when required fields are empty' do
        property = Property.new
        property.save
        expect(property).to_not be_valid
        expect(property.errors).to be_present
        expect(property.errors.to_hash.keys).to include(
          :availability, :slots, :owner_id, :approved, :property_type, :listing_type,  :monthly_price, :deposit_advance, 
          :deposit_security, :location_city, :location_lat, :location_lng, :long_address, :accomodation_type)
        expect(property.errors[:availability]).to include("can't be blank")
    end
    it 'raise error when property type is wrong' do
      type_wrong = Property.create(property_type: "wrong")
      expect(type_wrong).to_not be_valid
      expect(type_wrong.errors).to be_present
      expect(type_wrong.errors.to_hash.keys).to include(:property_type)
      expect(type_wrong.errors[:property_type]).to include("not valid")
    end
    it 'raise error when listing type is wrong' do
      type_wrong = Property.create(listing_type: "wrong")
      expect(type_wrong).to_not be_valid
      expect(type_wrong.errors).to be_present
      expect(type_wrong.errors.to_hash.keys).to include(:listing_type)
      expect(type_wrong.errors[:listing_type]).to include("not valid")
    end
    it 'raise error when monthly price is less than 0' do
      type_wrong = Property.create(monthly_price: -1)
      expect(type_wrong).to_not be_valid
      expect(type_wrong.errors).to be_present
      expect(type_wrong.errors.to_hash.keys).to include(:monthly_price)
      expect(type_wrong.errors[:monthly_price]).to include("must be greater than 0")
    end
  end
end

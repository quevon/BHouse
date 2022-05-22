require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "is not valid without a email" do
    admin = AdminUser.new(email: nil)
    expect(admin).to_not be_valid
  end
  it "is not valid without a password" do
    admin = AdminUser.new(password: nil)
    expect(admin).to_not be_valid
  end

  it "is not unique email" do
    first_email = AdminUser.create(email: "admin@gmail.com", password: '123456')
    second_email =  AdminUser.create(email: "admin@gmail.com", password: '123456')
  
    expect(second_email).to_not be_valid
    expect(second_email.errors).to be_present
    expect(second_email.errors.to_hash.keys).to include(:email)
    expect(second_email.errors[:email]).to include("has already been taken")
  
  end


end

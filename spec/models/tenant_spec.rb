require 'rails_helper'

RSpec.describe Tenant, type: :model do

  # pending "add some examples to (or delete) #{__FILE__}
  it "is not valid without a email" do
    tenant = Tenant.new(email: nil)
    expect(tenant).to_not be_valid
  end
  it "is not valid without a password" do
    tenant = Tenant.new(password: nil)
    expect(tenant).to_not be_valid
  end
  it "is not valid without a firstname" do
    tenant = Tenant.new(firstname: nil)
    expect(tenant).to_not be_valid
  end
  it "is not valid without a middlename" do
    tenant = Tenant.new(middlename: nil)
    expect(tenant).to_not be_valid
  end
  it "is not valid without a lastname" do
    tenant = Tenant.new(lastname: nil)
    expect(tenant).to_not be_valid
  end
  


  context "validations" do

  end

end
require 'rails_helper'

RSpec.describe Owner, type: :model do

  # pending "add some examples to (or delete) #{__FILE__}
  it "is not valid without a email" do
    owner = Owner.new(email: nil)
    expect(owner).to_not be_valid
  end
  it "is not valid without a password" do
    owner = Owner.new(password: nil)
    expect(owner).to_not be_valid
  end
  it "is not valid without a firstname" do
    owner = Owner.new(firstname: nil)
    expect(owner).to_not be_valid
  end
  it "is not valid without a middlename" do
    owner = Owner.new(middlename: nil)
    expect(owner).to_not be_valid
  end
  it "is not valid without a lastname" do
    owner = Owner.new(lastname: nil)
    expect(owner).to_not be_valid
  end
  


  context "validations" do

  end

end
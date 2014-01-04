require 'spec_helper'

describe Organization::Master do

  it_should_behave_like "versionable", :organization_master

  # Valid Factory
  it "has a valid factory" do
    expect(create(:organization_master)).to be_valid
  end

  # Validations
  it "requires a name" do
    expect(build(:organization_master)).to validate_presence_of(:name)
  end

end

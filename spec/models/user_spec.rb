require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value("my@email.com").for(:email) }
  it { should_not allow_value("@email.com").for(:email) }
  it { should_not allow_value("email.com").for(:email) }
  it { should_not allow_value("my@email").for(:email) }
  it { should_not allow_value("my@e_mail.com").for(:email) }
  it { should_not allow_value("my!@email.com").for(:email) }
  it { should_not allow_value("my @email.com").for(:email) }

  it { should validate_presence_of(:password) }
  it { should ensure_length_of(:password).is_at_least(8) }

  it { should_not validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(80) }

end

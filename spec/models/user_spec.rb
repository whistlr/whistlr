require 'spec_helper'

describe User do

  # Valid Factory
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end

  # Validations
  it "requires an email address" do
    expect(build(:user)).to validate_presence_of(:email)
  end

  it "requires an unique email address" do
    expect(create(:user)).to validate_uniqueness_of(:email).case_insensitive
  end

  it "requires a valid email address" do
    expect(build(:user)).to allow_value("my@email.com").for(:email)
    expect(build(:user)).to_not allow_value("@email.com", "email.com", "my@email",
      "my@e_mail.com", "my!@email.com", "my @email.com").for(:email)
  end

  it "requires a password" do
    expect(build(:user)).to validate_presence_of(:password)
  end
  it "requires that the passwords be at least 8 characters long" do
    expect(build(:user)).to ensure_length_of(:password).is_at_least(8)
  end

  it "requires an unique name" do
    expect(create(:user)).to validate_uniqueness_of(:name).case_insensitive
  end
  it "will not permit a name over 80 characters long" do
    expect(build(:user)).to ensure_length_of(:name).is_at_most(80)
  end

  # Callbacks
  it "creates a default name if one isn't provided" do
    expect(create(:user, name: "").name).to match(/user_\d*/)
  end
  it "creates an authenticity token before save" do
    expect(create(:user).authentication_token).to_not be_nil
  end

  # Methods
  it "returns the value of a user's vote" do
    user = create(:user)
    vote = create(:vote, user: user)
    expect(user.vote_for(vote.voteable)).to eq vote.value
  end
  it "returns nil if a user hasn't voted upon a given votable" do
    user = create(:user)
    voteable = create(:organization_master).versions.first
    expect(user.vote_for(voteable)).to be_nil
  end
  it "returns the value of a user's response" do
    user = create(:user)
    response = create(:report_response, user: user)
    expect(user.response_for(response.report)).to eq response.value
  end
  it "returns nil if a user hasn't responded to a given report" do
    user = create(:user)
    report = create(:report_master)
    expect(user.response_for(report)).to be_nil
  end

end

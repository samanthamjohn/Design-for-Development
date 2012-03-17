require 'spec_helper'

describe User do
  it { create(:user); should validate_uniqueness_of :email }

  context "available" do
    subject { build(:user, available: true) }
    it { should validate_presence_of :about }
    it { should validate_presence_of :looking_for }
    it { should validate_presence_of :city }
    it { should validate_presence_of :talent_type }
  end

  context "available is not set" do
    it { should_not validate_presence_of :about }
    it { should_not validate_presence_of :looking_for }
    it { should_not validate_presence_of :city }
    it { should_not validate_presence_of :talent_type }
  end


end

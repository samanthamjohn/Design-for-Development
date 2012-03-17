require 'spec_helper'
require "cancan/matchers"

describe Ability do

  context "Guest" do
    subject { Ability.new(User.new) }
    it { should be_able_to(:read, :all) }
    it { should be_able_to(:create, User) }
  end

  context "signed in" do
    let(:user) { create(:user) }
    let(:ability) { Ability.new(user) }
    it "should be able to manage its record" do
      ability.should be_able_to(:manage, user)
    end
  end
end

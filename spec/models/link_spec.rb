require 'spec_helper'

describe Link do
  it { should belong_to :user }
  it { should validate_presence_of :url }
  it { should validate_presence_of :name }
  it { should validate_presence_of :user }

  it "should have a factory" do
    build(:link).should be_valid
  end
end

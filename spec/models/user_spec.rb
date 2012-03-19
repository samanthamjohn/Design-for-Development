require 'spec_helper'

describe User do
  it { create(:user); should validate_uniqueness_of :email }
  it { should have_many :skills }
  it "should have a factory" do
    build(:user).should be_valid
  end

  context "available" do
    subject { build(:user, available: true) }
    it { should validate_presence_of :about }
    it { should validate_presence_of :looking_for }
    it { should validate_presence_of :city }
    it { should validate_presence_of :talent_type }
    it { should validate_presence_of :name }
  end

  context "available is not set" do
    it { should_not validate_presence_of :about }
    it { should_not validate_presence_of :looking_for }
    it { should_not validate_presence_of :city }
    it { should_not validate_presence_of :talent_type }
    it { should_not validate_presence_of :name }
  end

  describe "after_initialize" do
    it "should set the skills" do
      create(:user, design_skills: ['ui'], development_skills: ['ruby'])
      user = User.first
      user.design_skills.should == ['ui']
      user.development_skills.should == ['ruby']
    end
  end

  describe "#before_save" do
    it "should save the user's skills" do
      user = build(:user, design_skills: ['ui', 'ux'], development_skills: ['ruby', 'python'], other_skills: "hello")
      user.save!
      user.skills.map(&:name).should =~ ['ui', 'ux', 'ruby', 'python', 'hello']
    end
  end

  it "should accept nested attributes for skills" do
    user = build(:user, skills_attributes: [{skill_type: "design", name: "ui"}])
    user.skills.first.name.should == 'ui'
  end

end

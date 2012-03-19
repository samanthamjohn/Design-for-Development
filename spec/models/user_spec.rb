require 'spec_helper'

describe User do
  it { create(:user); should validate_uniqueness_of :email }
  it { should have_many :skills }
  it { should have_many :links }
  it "should have a factory" do
    build(:user).should be_valid
    build(:available_user).should be_valid
  end

  describe "scopes" do
    describe ".designers" do
      it "should return the designers and both" do
        developer = create(:available_user, talent_type: "developer")
        designer = create(:available_user, talent_type: "designer")
        both = create(:available_user, talent_type: "both")
        User.designers.should =~ [both, designer]
      end
    end

    describe ".developers" do
      it "should return the designers and both" do
        developer = create(:available_user, talent_type: "developer")
        designer = create(:available_user, talent_type: "designer")
        both = create(:available_user, talent_type: "both")
        User.developers.should =~ [both, developer]
      end
    end
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

  it "should accept nested attributes for links" do
    user = build(:user, links_attributes: [{name: "Dribbble", url: "http://dribble.com"}, {name: "Twitter", url: "twitter.com"}])
    user.links.map(&:name).should =~ ["Dribbble", "Twitter"]
  end

end

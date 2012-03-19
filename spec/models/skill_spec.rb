require 'spec_helper'

describe Skill do
  it { should belong_to :user }
  it "should have a factory" do
    build(:skill).should be_valid
  end

  describe "validations" do
    it { should validate_presence_of :skill_type }
    it { should validate_presence_of :user }
    it { should validate_presence_of :name }

    it "should validate a design skill" do
      skill = build(:skill, skill_type: "design")
      skill.name = "ruby"
      skill.should_not be_valid
      skill.name = "ui"
      skill.should be_valid
    end

    it "should validate a developer skill" do
      skill = build(:skill, skill_type: "development")
      skill.name = "ui"
      skill.should_not be_valid
      skill.name = "ruby"
      skill.should be_valid
    end
  end
end

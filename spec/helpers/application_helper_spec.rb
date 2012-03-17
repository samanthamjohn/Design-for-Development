require 'spec_helper'
describe ApplicationHelper do
  describe "#human_talent_type" do
    it "should map the talent type to a sentence" do
      human_talent_type("Designer").should == "I am a designer."
      human_talent_type("Developer").should == "I am a developer."
      human_talent_type("Both").should == "I am both a designer and a developer."
      human_talent_type("Other").should == "I am not a designer or a developer but I have other useful skills."
    end
  end

end

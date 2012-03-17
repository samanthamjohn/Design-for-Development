require 'spec_helper'

describe User do
  it { create(:user); should validate_uniqueness_of :email }
end

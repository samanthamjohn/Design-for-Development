# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link do
    name "Dribbble"
    url "dribble.com"
    user { FactoryGirl.build(:user) }
  end
end

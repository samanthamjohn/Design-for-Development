# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skill do
    name "ui"
    skill_type "design"
    user { FactoryGirl.build(:user) }
  end
end

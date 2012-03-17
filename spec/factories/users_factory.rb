FactoryGirl.define do
  factory :user do
    sequence(:email) { "#{LoremAthlete::athlete.gsub(" ", '.')}@example.com" }
    password 'password'
  end
end

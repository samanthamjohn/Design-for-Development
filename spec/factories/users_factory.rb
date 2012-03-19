FactoryGirl.define do
  factory :user do
    sequence(:email) { "#{LoremAthlete::athlete.gsub(" ", '.')}@example.com" }
    password 'password'
  end

  factory :available_user, parent: :user do
    available true
    about "hello"
    looking_for "goodbye"
    city "New york"
    talent_type "designer"
    name "Sam John"
  end
end

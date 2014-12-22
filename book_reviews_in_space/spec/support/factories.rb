FactoryGirl.define do
  factory :user do
    name "Diego De Souza"
    sequence(:email) { |n| "#{n}example@example.com"}
    password "password"
  end
end

FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    name "Diego De Souza"
    email
    password
  end

  sequence :password do |n|
    "{n}password"
  end
end

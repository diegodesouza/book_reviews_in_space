FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user do
    name "Diego De Souza"
    email
    password
  end
end

FactoryGirl.define do
  sequence :password do |n|
    "{n}password"
  end
end

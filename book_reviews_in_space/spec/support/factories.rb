FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    name "Diego De Souza"
    email
    password
    role "member"
  end

  sequence :password do |n|
    "{n}password"
  end

  factory :book do
    title "SomeTitle"
    description "This is some description of the book, so it should work"
    url "http://www.essential.com"
  end
end

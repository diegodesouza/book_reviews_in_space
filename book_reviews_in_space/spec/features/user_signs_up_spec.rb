require 'rails_helper'

  feature "User signs up", %q(
    As a prospective user
    I want to create an account
    So that I can post books and review them

  Acceptance Criteria

  - [ ] There is a link to 'Sign Up' on the homepage.
  - [ ] If I fill in my name, email, password, and password confirmation correctly,
    I am greeted with a confirmation message that my account has been created.
  - [ ] If the password and password confirmation fields do not match, I am given an error message.
  - [ ] If my email already exists in the database, I am given a message that tells me I have already registered.
  - [ ] If my email is not formatted correctly, I am given an error message.
) do

  it "user provides valid information" do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Diego De Souza"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end

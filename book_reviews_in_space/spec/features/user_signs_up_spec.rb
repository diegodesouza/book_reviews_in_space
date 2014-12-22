require 'rails_helper'

  feature "User signs up", %q(
    As a prospective user
    I want to create an account
    So that I can post books and review them

  Acceptance Criteria

  - [X] There is a link to 'Sign Up' on the homepage.
  - [X] If I fill in my name, email, password, and password confirmation correctly,
    I am greeted with a confirmation message that my account has been created.
  - [ ] If the password and password confirmation fields do not match, I am given an error message.
  - [ ] If my email already exists in the database, I am given a message that tells me I have already registered.
  - [ ] If my email is not formatted correctly, I am given an error message.
) do

  it "user provides valid information" do
    visit '/'
    click_link("Sign up", match: :first)
    fill_in "Name", with: "Diego De Souza"
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
        expect(page).to have_content "Welcome! You have signed up successfully."
    save_and_open_page
  end
end

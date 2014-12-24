require 'rails_helper'

  feature "User signs up", %q(
    As a prospective user
    I want to create an account
    So that I can post books and review them

  Acceptance Criteria

  - [X] There is a link to 'Sign Up' on the homepage.
  - [X] If I fill in my name, email, password, and password confirmation correctly,
    I am greeted with a confirmation message that my account has been created.
  - [X] If the password and password confirmation fields do not match, I am given an error message.
  - [X] If my email already exists in the database, I am given a message that tells me I have already registered.
  - [X] If my email is not formatted correctly, I am given an error message.
) do

  it "provides valid information" do
    valid = create :user
    email = generate :email

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: valid.name
    fill_in "Email", with: email
    fill_in "Password", with: valid.password
    fill_in "Password confirmation", with: valid.password
    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  it "provides invalid password confirmation" do
    user = create :user
    email = generate :email

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: user.name
    fill_in "Role", with: "user"
    fill_in "Email", with: email
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    save_and_open_page
    expect(page).to have_content "Password confirmation does not match!"

  end

  it "email has already been registered" do

    existing_user = User.create(
      name: "Diego De Souza",
      email: "example@example.com",
      password: "password"
    )

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: existing_user.name
    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password
    fill_in "Password confirmation", with: existing_user.password
    click_button "Sign up"


    expect(page).to have_content "Email has already been taken"
  end

  it "gives me an error for incorrect formatted email" do

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: "Diego"
    fill_in "Email", with: "--\.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content "Email is invalid"
  end
end

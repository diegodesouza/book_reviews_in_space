require 'rails_helper'

  feature "User deletes account", %q(
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app

  - [X] In my home page I can navigate to edit profile and chose to delete my account
  - [] When clicking delete my account i should see a message "are you sure?"
  - [X] if i click delete my account it should delete it from my database
  ) do

  it "user updates his account" do

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: "Diego"
    fill_in "Email", with: "one@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    click_on "Edit profile"
    click_on "Cancel my account"
save_and_open_page

    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."

  #scenario "user sees a message after clicking delete my account"
  end
end

require 'rails_helper'

feature "User deletes account", %q(
As an authenticated user
I want to delete my account
So that my information is no longer retained by the app

- [] I can navigate to edit profile and chose to delete my account
- [] if i click delete my account it should delete from my database
- []
) do

  scenario "user deletes his account"

  current_user#as logged in

  visit root_path

  click_on "Edit profile"
  click_on "Cancel my account"

  expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
end

require 'rails_helper'

feature "User deletes account", %q(
  As an authenticated user
  I want to see my profile page
  So that I can change information on it

  - [] I can update my profile
  - [] When clicking delete my account i should see a message "are you sure?"
  - [] if i click delete my account it should delete it from my database
  ) do

  it "user deletes his account" do
    user = create :user

    visit root_path

    visit '/'

    click_link("Sign up", match: :first)
    fill_in "Name", with: user.name
    fill_in "Email", with: "some@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    click_on "Edit profile"
    fill_in "Email", with: "cool@email.com"
    fill_in "Current password", with: "password"
    click_on "Update"

    expect(page).to have_content "Your account has been updated successfully."

  end
end

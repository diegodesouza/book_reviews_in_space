require 'rails_helper'

feature "User deletes account", %q(
  As an authenticated user
  I can change my role on my profile page to astronaut
  So I can post books and review them as an astronaut

  - [] I can update my role

  ) do

  it "user updates his role" do
    user = create :user

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: user.name
    fill_in "Role", with: "something"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    click_on "Edit profile"
    fill_in "Role", with: "Astronaut"
    fill_in "Current password", with: "password"
    click_on "Update"

    expect(page).to have_content "Your account has been updated successfully."

  end
end

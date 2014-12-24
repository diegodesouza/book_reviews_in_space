require 'rails_helper'

feature "User deletes account", %q(
  As an authenticated user
  I can change my role on my profile page to astronaut
  So I can post books and review them as an astronaut

  - [] I can update my role

  ) do

  it "user updates his role" do
    user = create :user
    password = generate :password

    sign_in_as(user)

    click_on "Edit profile"
    fill_in "Role", with: "Astronaut"
    fill_in "Current password", with: password
    click_on "Update"

    expect(page).to have_content "Your account has been updated successfully."
  end
end

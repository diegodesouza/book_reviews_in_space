require 'rails_helper'

feature "User deletes account", %q(
    As an authenticated user
    I want to sign out
    So that no one else can post books or reviews on my behalf

    - [] user can successfully log in
    - [] user can successfully log out
    ) do


  it "user signs out" do
    valid = create :user
    email = generate :email

    visit '/'

    click_link("Sign up", match: :first)
    fill_in "Name", with: valid.name
    fill_in "Email", with: email
    fill_in "Password", with: valid.password
    fill_in "Password confirmation", with: valid.password
    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."

    click_on "Logout"

    expect(page).to have_content "Signed out successfully."
  end
end

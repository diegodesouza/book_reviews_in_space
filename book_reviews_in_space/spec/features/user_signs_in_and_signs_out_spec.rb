require 'rails_helper'

feature "User deletes account", %q(
    As an unauthenticated user
    I want to sign in
    So that I can post books and review them

    As an authenticated user
    I want to sign out
    So that no one else can post books or reviews on my behalf
    

    - [X] user can successfully log in
    - [X] user can successfully log out
    ) do


  it "user signs out" do
    user = create :user

    sign_in_as(user)

    expect(page).to have_content "Signed in successfully."

    click_on "Logout"

    expect(page).to have_content "Signed out successfully."
  end
end

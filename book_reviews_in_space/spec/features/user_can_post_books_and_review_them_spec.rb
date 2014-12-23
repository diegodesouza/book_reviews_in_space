require 'rails_helper'

feature "User deletes account", %q(
As an unauthenticated user
I want to sign in
So that I can post books and review them

- [] I can sign in
- [] I can post a book
- [] I can review my books
) do

  it "signs in and post a book for review" do
    user = create :user

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: user.name
    fill_in "Email", with: "book@email.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    expect(page).to have_content "Welcome! You have signed up successfully."

    click_on "Add new book"
    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Great book, a must read for book lovers"
    fill_in "URL", with: "www.somebook.com"
    click_on "Add book"

    expect(page).to have_content "Your have successfully added a new book."

  end
end

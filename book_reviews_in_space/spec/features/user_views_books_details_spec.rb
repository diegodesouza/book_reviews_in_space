require 'rails_helper'

feature "View a Book's Details", %q(

  As a user
  I want to view a book's details
  So that I can see a book's details

  Acceptance Criteria

  - [] I must be able to get to this page from the books index
  - [] I must see the book's title
  - [] I must see the book's description
  - [] I must see the book's URL
) do

  it "must be able to click book to see its details" do
    user = create :user
    email = generate :email
    book = create :book
    password = generate :password

    visit root_path

    click_link("Sign up", match: :first)

    fill_in "Name", with: user.name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password

    click_button "Sign up"

    click_on "Add new book"

    fill_in "title", with: book.title
    fill_in "description", with: book.description
    fill_in "url", with: book.url

    click_on "Add book"

    save_and_open_page

    click_on "well"

    expect(page).to have_content "Title: SomeTitle"
    expect(page).to have_content "Description: This is some description of the book, so it should work"
    expect(page).to have_content "URL: http://www.essential.com"
  end
end

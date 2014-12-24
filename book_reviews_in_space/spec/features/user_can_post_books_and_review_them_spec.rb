require 'rails_helper'

feature "User deletes account", %q(
As an unauthenticated user
I want to sign in
So that I can post books and review them

- [X] I can sign in
- [X] I can post a book
- [] I can review my books
- [X] I am presented with errors if i fill out the form incorrectly
) do

  it "signs in and post a book for review" do
    user = create :user

    sign_in_as(user)

    click_on "Add new book"

    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Great book, a must read for book lovers"
    fill_in "URL", with: "http://www.somebook.com"

    click_on "Add book"

    expect(page).to have_content "Your have successfully added a new book."
  end

  it "gives me errors if leave title blank" do
    user = create :user

    sign_in_as(user)

    click_on "Add new book"

    fill_in "Title", with: ""
    fill_in "Description", with: "Try this"
    fill_in "URL", with: "https//new.com"

    click_on "Add book"

    expect(page).to have_content "Title can't be blank"
  end

   it "gives me errors if leave description blank" do
    user = create :user

    sign_in_as(user)

    click_on "Add new book"

    fill_in "Title", with: "Some Title"
    fill_in "Description", with: ""
    fill_in "URL", with: "https//new.com"

    click_on "Add book"


    expect(page).to have_content "Description can't be blank"
  end

  it "gives me errors if leave url blank" do
    user = create :user

    sign_in_as(user)

    click_on "Add new book"

    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Try this"
    fill_in "URL", with: ""

    click_on "Add book"

    expect(page).to have_content "Url can't be blank"
  end

  it "gives me errors if url is invalid" do
    user = create :user

    sign_in_as(user)

    click_on "Add new book"

    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Try this"
    fill_in "URL", with: "www.new.com"

    click_on "Add book"

    expect(page).to have_content "Url is invalid"
  end
end
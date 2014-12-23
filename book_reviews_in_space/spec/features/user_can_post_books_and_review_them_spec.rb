require 'rails_helper'

feature "User deletes account", %q(
As an unauthenticated user
I want to sign in
So that I can post books and review them

- [] I can sign in
- [] I can post a book
- [] I can review my books
- [] I am presented with errors if i fill out the form incorrectly
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

  it "gives me errors if leave title blank" do
    user = create :user
    password = generate :password
    email = generate :email

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: user.name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Sign up"

    click_on "Add new book"

    fill_in "Title", with: ""
    fill_in "Description", with: "Try this"
    fill_in "URL", with: "https//new.com"

    click_on "Add book"


    expect(page).to have_content "Title can't be blank"
  end

  it "gives me errors if leave description blank" do
    user = create :user
    password = generate :password
    email = generate :email

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: user.name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Sign up"

    click_on "Add new book"

    fill_in "Title", with: "Some Title"
    fill_in "Description", with: ""
    fill_in "URL", with: "https//new.com"

    click_on "Add book"


    expect(page).to have_content "Description can't be blank"
  end

  it "gives me errors if leave url blank" do
    user = create :user
    password = generate :password
    email = generate :email

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: user.name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Sign up"

    click_on "Add new book"

    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Try this"
    fill_in "URL", with: ""

    click_on "Add book"


    expect(page).to have_content "Url can't be blank"
  end
  
  it "gives me errors if url is invalid" do
    user = create :user
    password = generate :password
    email = generate :email

    visit root_path

    click_link("Sign up", match: :first)
    fill_in "Name", with: user.name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_button "Sign up"

    click_on "Add new book"

    fill_in "Title", with: "Some title"
    fill_in "Description", with: "Try this"
    fill_in "URL", with: "www.new.com"

    click_on "Add book"

    expect(page).to have_content "Url is invalid"
  end
end

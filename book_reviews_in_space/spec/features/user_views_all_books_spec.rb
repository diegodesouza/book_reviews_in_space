require 'rails_helper'

feature "", %q(

  As a user
  I want to view recently posted books
  So that I can see what others are reading

  Acceptance Criteria

  - [] I must see the title of each book
  - [] I must see the description of each book
  - [] I must see the URL of each book
  - [] I must see books listed in order, most recently posted first
  - [] I must see if a book was posted by an astronaut or a candidate
) do

  it "must show home page with some books info" do
    user = create :user

    sign_in_as(user)


    expect(page).to have_content "Title: well"
    expect(page).to have_content "Description: Some description about this book"
    expect(page).to have_content "URL: http://www.essential.com"
    save_and_open_page
    expect(page).to have_content "Role: member"
  end
end

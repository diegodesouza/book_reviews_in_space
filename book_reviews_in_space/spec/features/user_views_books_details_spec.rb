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

    sign_in_as(user)

    click_on "well"

    expect(page).to have_content "Title: well"
    expect(page).to have_content "Description: Some description about this book"
    expect(page).to have_content "URL: http://www.essential.com"
    save_and_open_page
    expect(page).to have_content "Role: member"
  end
end
<<<<<<< HEAD


# context "signed in user" do
#   before(:each) do
#     user = FactoryGirl.create(:user)
#     sign_in user
#   end
#
#   scenario "interact with website" do
#
#   end
# end
#
# context "unauthenticated user" do
#   scenario "interact with website" do
#
#   end
# end
=======
>>>>>>> 4c42ca0b2fcef2d00057bcbabe6bf4ccee1fad05

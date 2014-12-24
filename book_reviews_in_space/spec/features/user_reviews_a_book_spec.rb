require 'rails_helper'

feature "Reviewing a Book", %q(

  As a user
  I want to view a book's details
  So that I can see a book's details

  Acceptance Criteria

  - [] I must be on the book detail page
  - [] I must provide a description that is at least 50 characters long
  - [] I must be presented with errors if I fill out the form incorrectly
) do

  it "must be able to review a book" do
    user = create :user

    sign_in_as(user)

    click_on "well" #title for the book

    click_on "Add review" #on the show page

    fill_in "Description" #reviewform

    click_on "Save" 

    expect(page).to have_content "Review created successfully"
  end
end

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

 it "" do
   user = create :user

   sign_in_as(user)

   expect(page).to have_content #title, description, url

 end




end

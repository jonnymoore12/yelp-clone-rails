require 'rails_helper'

feature do
  before do
    slims = Restaurant.create(name: "Jack Rabbit Slims")
    slims.reviews.create(thoughts: "Danced the night away", rating:5)
  end

  scenario "A user can endorse a review which increases the review endorsement count" do
    visit '/restaurants'
    click_link "Endorse Review"
    expect(page).to have_content "1 endorsement"
  end

end

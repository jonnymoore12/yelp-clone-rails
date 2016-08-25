require 'rails_helper'

feature 'Reviewing' do
  before { Restaurant.create(name: 'KFC')}

  scenario 'Allows users to leave a review using a form' do
    sign_up
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: "Just the best"
    select '5', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content "Just the best"
  end

  scenario 'Displays an average rating for all the reviews' do
    leave_review(rating: 5)
    sign_up(email: "someoneelse@mail.com",
            password: "password",
            password_confirmation: "password")
    leave_review(rating: 3)
    expect(page).to have_content "Average rating: ★★★★☆"
  end
end

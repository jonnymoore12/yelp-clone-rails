def sign_up(email: "jonny@gmail.com",
            password: "password",
            password_confirmation: "password")
  visit '/users/sign_up'
  expect(page.status_code).to eq(200)
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def jonny_creates_a_restaurant
  sign_up
  click_link "Add a restaurant"
  fill_in "Name", with: "Central Perk"
  click_button "Create Restaurant"
end

def leave_review(thoughts: "Generic thought", rating: 3)
  visit '/restaurants'
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end

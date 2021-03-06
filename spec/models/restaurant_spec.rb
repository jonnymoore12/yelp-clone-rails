require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: 'kf')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

  it 'is not valid unless is has a unique name' do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end

  it { is_expected.to have_many :reviews }

  describe 'Reviews' do
    describe 'build_with_user' do

      let(:user){ User.create email: 'test@test.com' }
      let(:restaurant) { Restaurant.create name: 'Test' }
      let(:review_params) { {rating: 5, thoughts: 'yum'} }

      subject(:review) { restaurant.reviews.build_with_user(review_params,user) }

      it 'builds a review' do
        expect(review).to be_a Review
      end

      it 'builds a review associated with the specified user' do
        expect(review.user).to eq user
      end
    end

    describe '#Average rating' do
      let(:user1){ User.create(email: "user@mail.com", password: "password",
                                password_confirmation: "password")}
      let(:user2){ User.create(email: "user2@mail.com", password: "secret",
                                password_confirmation: "secret")}
      context 'No reviews' do
        it "returns 'N/A' when there are no reviews" do
          restaurant = Restaurant.create(name: "The Swan With Two Necks")
          expect(restaurant.average_rating).to eq 'N/A'
        end
      end

      context '1 review' do
        it "returns the rating when there is 1 review" do
          restaurant = Restaurant.create(name: "The Swan With Two Necks")
          restaurant.reviews.create(rating:4)
          expect(restaurant.average_rating).to eq 4
        end
      end

      context 'Multiple reviews' do
        it "returns the average rating based on all the reviews" do
          restaurant = Restaurant.create(name: "The Swan With Two Necks")
          restaurant.reviews.create_with_user({rating:5}, user1)
          restaurant.reviews.create_with_user({rating:1}, user2)
          # require 'pry'; binding.pry
          expect(restaurant.average_rating).to eq 3
        end
      end
    end

  end

end

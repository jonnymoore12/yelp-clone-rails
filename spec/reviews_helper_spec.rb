require 'rails_helper'

describe ReviewsHelper, :type => :helper do

  context '#star_rating' do

    it 'does nothing for a non number' do
      expect(helper.star_rating('N/A')).to eq 'N/A'
    end

    it 'returns 5 black stars for ave rating of 5' do
      expect(helper.star_rating(5)).to eq '★★★★★'
    end

    it 'returns 3 black stars and 2 white stars for ave rating of 3' do
      expect(helper.star_rating(3)).to eq '★★★☆☆'
    end

    it 'returns 2 black stars and three white stars for ave rating of 1.5' do
      expect(helper.star_rating(1.5)).to eq '★★☆☆☆'
    end

  end
end

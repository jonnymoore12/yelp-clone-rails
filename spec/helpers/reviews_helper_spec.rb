require 'rails_helper'

describe ReviewsHelper, :type => :helper do
  context '#star_rating' do
    it 'does nothing for a non number' do
      expect(helper.star_rating('N/A')).to eq 'N/A'
    end
  end
end

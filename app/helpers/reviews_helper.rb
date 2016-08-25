module ReviewsHelper
  def star_rating(rating)
    return rating unless rating.is_a?(Numeric)
    '★' * rating.round + '☆' * remainder(rating)
  end

  private

  def remainder(number)
    5 - number.round
  end

end

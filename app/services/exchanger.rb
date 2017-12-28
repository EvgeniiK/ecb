# frozen_string_literal: true
class Exchanger

  def self.exchange(eur_amount, dates)
    rates = EurUsdRate.where(date: dates)
    [dates].flatten.map do |date|
      rate = rates.find_by(date: date)
      {date => rate ? (eur_amount * rate.value).round(2) : ''}
    end
  end

end

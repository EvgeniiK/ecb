# frozen_string_literal: true

FactoryGirl.define do
  factory :eur_usd_rate do
    date    { Faker::Date.between(1.year.ago, Date.today) }
    value   { Faker::Number.decimal(1, 4) }
  end
end

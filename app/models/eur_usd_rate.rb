# frozen_string_literal: true

class EurUsdRate < ApplicationRecord
  validates :date, uniqueness: true
end

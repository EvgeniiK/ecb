# frozen_string_literal: true

require 'rails_helper'

describe EurUsdRate, 'validations' do
  it { should validate_uniqueness_of(:date) }
end
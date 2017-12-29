# frozen_string_literal: true

require 'rails_helper'

describe Exchanger, type: :service do
  let(:false_dates)   { (0..3).map { Faker::Date.between(Date.today, 1.year.after ) } }
  let(:saved_dates)   { (0..5).map { Faker::Date.between(1.year.ago, Date.today) } }
  let(:all_dates)     { saved_dates + false_dates }
  let(:value)         { 100 }

  before(:each) do
    saved_dates.map { |d| FactoryGirl.create(:eur_usd_rate, date: d)}
  end

  describe '.exchange' do
    subject { described_class.exchange(value, all_dates) }

    it 'should return ten objects' do
      expect(subject.size).to be(all_dates.size)
    end

    it 'should return object with value for existing dates' do
      expect(subject).to include(saved_dates[0] => (EurUsdRate.find_by(date: saved_dates[0]).value * value).round(2) )
    end

    it 'should return object without value for false dates' do
      expect(subject).to include(false_dates[0] => 'no value')
    end

  end
end

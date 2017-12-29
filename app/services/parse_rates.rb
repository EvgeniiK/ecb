# frozen_string_literal: true
require 'csv'
require 'open-uri'

CSV_URL='http://sdw-wsrest.ecb.europa.eu/service/data/EXR/D.USD.EUR.SP00.A?format=csvdata'

class ParseRates
  def self.perform(file: open(CSV_URL), date_column: 'TIME_PERIOD', value_column: 'OBS_VALUE')
    last_rate_date = EurUsdRate.order(:date).last&.date || ''
    CSV.foreach(file, :headers => true) do |row|
      rh = row.to_hash
      next if last_rate_date.to_s >= rh[date_column]
      EurUsdRate.create(date: rh[date_column], value: rh[value_column].to_f)
    end
  rescue => e
    puts "CSV parse & saving failed: #{e.message}"
  end
end

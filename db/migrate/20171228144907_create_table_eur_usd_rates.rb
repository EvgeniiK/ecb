class CreateTableEurUsdRates < ActiveRecord::Migration[5.1]
  def change
    create_table :eur_usd_rates do |t|
      t.date :date, index: true
      t.float :value
    end
  end
end

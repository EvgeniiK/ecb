# frozen_string_literal: true

require 'rails_helper'

describe ParseRates, type: :service do
  describe '.perform' do
    let(:call_method) { described_class.perform(file: 'spec/fixtures/files/data.csv') }

    it { expect { call_method }.to change { EurUsdRate.count } }

    it 'should`t create any new records in db if there are no new records' do
      call_method
      expect { call_method }.not_to change { EurUsdRate.count }
    end
  end
end

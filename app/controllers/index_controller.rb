class IndexController < ApplicationController

  def index
  end

  def exchange
    # Call of the ParseRates service should be scheduled
    ParseRates.perform
    @result = Exchanger.exchange(permitted_params[:amount].to_i, permitted_params[:dates].gsub(/\s+/, '').split(','))
    render :index
  end

  private

  def permitted_params
    params.permit(:amount, :dates)
  end
end

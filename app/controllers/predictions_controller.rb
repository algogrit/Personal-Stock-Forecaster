class PredictionsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.find_by_id(params[:stock][:id])
    @prediction = @stock.last_trading_day.prediction
  end

end
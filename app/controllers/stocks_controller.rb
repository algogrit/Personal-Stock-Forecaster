class StocksController < ApplicationController

  before_filter :authenticate_user!

  # GET /stocks
  # GET /stocks.json
  def index
    @stocks = Stock.paginate page: params[:page], order: 'name', per_page: 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stocks }
    end
  end

  # GET /stocks/1
  # GET /stocks/1.json
  def show
    @stock = Stock.find(params[:id])
    @trading_days = @stock.trading_days.paginate page: params[:page], order: 'date_of_trade desc', per_page: 15

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock }
    end
  end
end
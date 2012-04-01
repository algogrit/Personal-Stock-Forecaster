class SharesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @shares = current_user.shares.paginate page: params[:page], per_page: 10

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shares }
    end
  end

  def show
    @share = Share.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @share }
    end
  end

  def new
    @share = Share.new
    @stocks = Stock.order('name')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @share }
    end
  end

  def edit
    @share = Share.find(params[:id])
    @stocks = Stock.order('name')
  end

  def create
    share_attributes = params[:share]
    @share = current_user.shares.find_by_stock_id(share_attributes[:stock_id])
    message = create_or_update(share_attributes)

    respond_to do |format|
      if @share.save
        format.html { redirect_to @share, notice: message }
        format.json { render json: @share, status: :created, location: @share }
      else
        format.html { render action: "new" }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @share = Share.find(params[:id])

    respond_to do |format|
      if @share.update_attributes(params[:share])
        format.html { redirect_to @share, notice: 'Share was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @share = Share.find(params[:id])
    @share.destroy

    respond_to do |format|
      format.html { redirect_to shares_url }
      format.json { head :no_content }
    end
  end

  private
  def create_or_update(share_attributes)
    if @share.nil?
      @share = current_user.shares.new(params[:share])
      message = @share.stock.name+' was successfully added to your portfolio.'
    else
      @share.update_attributes(share_attributes)
      message = @share.stock.name+' was updated.'
    end
    message
  end
end
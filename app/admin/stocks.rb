ActiveAdmin.register Stock do
  action_item :only => :index do
    link_to 'Update Quotes', fetch_quotes_admin_stocks_path
  end

  collection_action :fetch_quotes do
    respond_to do |format|
      if Stock.fetch_all_quotes
        format.html { redirect_to admin_stocks_url, notice: 'Stock quotes have been updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to admin_stocks_url, alert: 'There has been some problem with fetching quotes, try again later.' }
        format.json { head :no_content }
      end
    end
  end

end

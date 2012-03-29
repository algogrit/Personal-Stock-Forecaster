class PagesController < ApplicationController

  def index
    if user_signed_in?
      respond_to do |format|
        format.html {redirect_to pages_home_url}
      end
    else
      respond_to do |format|
        format.html {redirect_to pages_welcome_url}
      end
    end
  end

  def home
  end

  def welcome
  end

  def about_us
  end

  def contact_us
  end
end

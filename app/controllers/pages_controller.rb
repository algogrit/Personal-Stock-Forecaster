class PagesController < ApplicationController

  def index
    if user_signed_in?
      @user = current_user
      respond_to do |format|
        format.html {render pages_home_path}
      end
    else
      respond_to do |format|
        format.html {render pages_welcome_path}
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

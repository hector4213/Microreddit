class ApplicationController < ActionController::Base
  include SessionsHelper
  include PostsHelper

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please Log in."
    end
  end

end

class CmsController < ApplicationController
  before_action :confirm_logged_in

  def index
  end

  private
  before_action :confirm_logged_in
  def confirm_logged_in
    unless session[:admin_id]
      flash[:notice] = "You need to log in"
      redirect_to(:controller => 'access', :action => 'login')
      return false
    else
      return true
    end
  end

end

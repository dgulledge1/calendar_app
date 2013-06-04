class UsersController < ApplicationController
  before_filter :signed_in_user
  
  def new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def calendar
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    @event_strips = current_user.events.event_strips_for_month(@shown_month)        
    @user = User.find_by_id(params[:id])
    
  end
  
  private
  
  def current_user?(user)
    user == current_user
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url
    end
  end
  
   def store_location
    session[:return_to] = request.url
  end
end

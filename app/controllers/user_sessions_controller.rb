class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
    render :layout => 'login'
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_back_or_default root_url
    else
      render :action => 'new', :layout => "login"
    end
  end
  
  def destroy
    @user_session = UserSession.find(params[:id])
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_back_or_default root_url
  end
end

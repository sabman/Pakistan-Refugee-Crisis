class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update] 
  before_filter :require_no_user, :only => [:new, :create]
  
  def show
    @user = current_user
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_back_or_default account_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated profile"
      redirect_back_or_default account_url
    else
      render :action => "edit" 
    end
  end
end

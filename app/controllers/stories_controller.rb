class StoriesController < ApplicationController
  before_filter :require_user, :only => [:new, :edit, :update, :delete] 
    
  def index
    @stories = Story.all
  end
  
  def show
    @story = Story.find(params[:id])
  end
  
  def new    
    @story = Story.new
  end
  
  def create
    @story = Story.new(params[:story])
    @story.user = current_user
    if @story.save
      flash[:notice] = "Successfully created story."
      redirect_to @story
    else
      render :action => 'new'
    end
  end
  
  def edit
    @story = Story.find(params[:id])
  end
  
  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:notice] = "Successfully updated story."
      redirect_to @story
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    flash[:notice] = "Successfully destroyed story."
    redirect_to stories_url
  end
  
  def donate
    session[:current_story]             = params[:id]
    session[:current_donation_option]   = params[:donation_option]
    redirect_to new_donation_url
  end
end

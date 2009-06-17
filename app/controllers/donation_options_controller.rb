class DonationOptionsController < ApplicationController
  def index
    @donation_options = DonationOption.all
  end
  
  def show
    @donation_option = DonationOption.find(params[:id])
  end
  
  def new
    @donation_option = DonationOption.new
  end
  
  def create
    @donation_option = DonationOption.new(params[:donation_option])
    if @donation_option.save
      flash[:notice] = "Successfully created donation option."
      redirect_to @donation_option
    else
      render :action => 'new'
    end
  end
  
  def edit
    @donation_option = DonationOption.find(params[:id])
  end
  
  def update
    @donation_option = DonationOption.find(params[:id])
    if @donation_option.update_attributes(params[:donation_option])
      flash[:notice] = "Successfully updated donation option."
      redirect_to @donation_option
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @donation_option = DonationOption.find(params[:id])
    @donation_option.destroy
    flash[:notice] = "Successfully destroyed donation option."
    redirect_to donation_options_url
  end
end

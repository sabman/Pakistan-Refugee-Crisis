class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end
  
  def create
    @donation = Donation.new(params[:donation])
    @donation.story = Story.find(session[:current_story])
    @donation.donation_option = DonationOption.find(session[:current_donation_option])
    @donation.ip_address = request.remote_ip
    
    if @donation.save
      if @donation.make
        session[:current_story] = session[:current_donation_option] = nil     
        render :action => "success"
      else
        render :action => "failure"
      end
    else
      render :action => 'new'
    end
  end
end

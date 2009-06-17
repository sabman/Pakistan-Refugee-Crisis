require File.dirname(__FILE__) + '/../spec_helper'
 
describe DonationsController do
  fixtures :all
  integrate_views
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Donation.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    Donation.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(donations_url)
  end
end

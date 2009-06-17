require File.dirname(__FILE__) + '/../spec_helper'

describe DonationOption do
  it "should be valid" do
    DonationOption.new.should be_valid
  end
end

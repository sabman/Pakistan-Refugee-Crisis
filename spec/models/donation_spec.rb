require File.dirname(__FILE__) + '/../spec_helper'

describe Donation do
  it "should be valid" do
    Donation.new.should be_valid
  end
end

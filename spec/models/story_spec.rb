require File.dirname(__FILE__) + '/../spec_helper'

describe Story do
  it "should be valid" do
    Story.new.should be_valid
  end
end

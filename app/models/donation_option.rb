class DonationOption < ActiveRecord::Base
  def amount_in_cents
    amount*100
  end
end

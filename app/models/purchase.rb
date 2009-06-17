# require "rubygems"
# require "active_merchant"

ActiveMerchant::Billing::Base.mode = :test

gateway = ActiveMerchant::Billing::PaypalGateway.new(
  :login      => "saburq_1242543289_biz_api1.gmail.com",
  :password   => "1242543303",
  :signature  => "An5ns1Kso7MWUdW4ErQKJJJ4qi4-AFgzoxRvL40Y..PBr-hUI-eoHIDp"  
)

credit_card = ActiveMerchant::Billing::CreditCard.new(
  :type               => "visa",
  :number             => "4024007148673576",  
  :verification_value => "123", 
  :month              => 1,
  :year               => 2010,
  :first_name         => "Shoaib", 
  :last_name          => "Burq" 
)

if credit_card.valid?                    
  response = gateway.purchase(1000, credit_card, :ip => "127.0.0.1")
  if response.success?
    puts "Purchase complete!"
  else
    puts "Error: #{response.message}"
  end
else
  p "Error: credit card is not valid #{credit_card.errors.full_messages.join('. ')}"
end
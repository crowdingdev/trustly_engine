module TrustlyEngine

# Read about factories at https://github.com/thoughtbot/factory_girl

require "faker"
FactoryGirl.define do
  factory :trustly_engine_request, :class => 'TrustlyEngine::Request' do

    uuid UUID.new.generate 
    signature "signaturesignaturesignature"

    add_attribute :method, "Withdraw"
    
    country "SE"
    user_id 34534545
    locale "sv_SE"

    amount 345
    currency "EUR"
    ip "192.168.0.1"
    
    #sequence(:ip) { |n| "192.168.0.#{n}"}
    phone_number "" #{ Faker::PhoneNumber.phone_number }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    nin 3443535
    address Faker::Address.street_address

  end
end
end
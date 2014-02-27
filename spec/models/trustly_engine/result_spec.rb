require 'spec_helper'

module TrustlyEngine

	describe Result do
		it "is working to parse the trustly notification request" do 
			
			@request = FactoryGirl.build(:trustly_engine_request)

			@result = FactoryGirl.build(:trustly_engine_result)

			@request.parse_notification(JSON.parse('{
				"method": "credit",
				"params": {
					"signature": "R9+hjuMqbsH0Ku ... S16VbzRsw==",
					"uuid": "258a2184-2842-b485-25ca-293525152425",
					"data": {
						"amount": "902.50",
						"currency": "EUR",
						"messageid": "98348932",
						"orderid": "87654567",
						"enduserid": "32123",
						"notificationid": "9876543456",
						"timestamp": "2010-01-20 14:42:04.675645+01",
						"attributes": {}
					}
					},
					"version": "1.1"
					}'))

			puts @request.inspect

		end
	end
end


#{
#    "method": "credit",
#    "params": {
#        "signature": "R9+hjuMqbsH0Ku ... S16VbzRsw==",
#        "uuid": "258a2184-2842-b485-25ca-293525152425",
#        "data": {
#            "amount": "902.50",
#            "currency": "EUR",
#            "messageid": "98348932",
#            "orderid": "87654567",
#            "enduserid": "32123",
#            "notificationid": "9876543456",
#            "timestamp": "2010-01-20 14:42:04.675645+01",
#            "attributes": {}
#        }
#    },
#    "version": "1.1"
#}
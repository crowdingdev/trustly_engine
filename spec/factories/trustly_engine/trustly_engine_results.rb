# TrustlyEngine::Result(id: integer,
 # signature: string, 
 # uuid: string, 
 # method: string, 
 # order_id: string, 
 # result: string, 
 # url: string, 
 # request_id: integer, 
 # created_at: datetime, 
 # updated_at: datetime
 # ) 

module TrustyEngine
	FactoryGirl.define do

		factory :trustly_engine_result, :class => 'TrustlyEngine::Result' do

			uuid UUID.new.generate
			signature "signaturesignaturesignature"
			order_id "34534534534"
			result "null"
			url "the_url_for_the_iframe"
			request_id "1531313535"

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


#{"result"
#	{"data"=>
#		{
#			"orderid"=>"4275709103", 
#			"url"=>"https://test.trustly.com/_/withdraw.php?SessionID=1afe35e6-0c66-4213-983df3d46e330b2d&OrderID=4275709103&Locale=sv_SE"
#			}, 
#
#			"method"=>"Withdraw",
#			 "signature"=>"Dnz/l/drWW8ZX4oZdkRDqaHT8VZrSpNm2SCKvxX+cyCb29lVEXQ==", 
#			"uuid"=>"2ead8320-8051-0131-673e-38f6b113f7f9"
#	}, 
#			"version"=>"1.1”}


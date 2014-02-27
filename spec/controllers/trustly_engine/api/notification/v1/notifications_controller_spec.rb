require 'spec_helper'

describe TrustlyEngine::Api::Notification::V1::NotificationsController do

	describe "post 'index'" do
		it "returns json-rps result with status OK" do
		
			
			params = { 
				:method => "debit",
				:params => {
					:signature => "R9+hjuMqbsH0KuS16VbzRsw==",
					:uuid => "258a2184-2842-b485-25ca-293525152425",
					:data => {
						:amount => "300.00",
						:currency => "EUR",
						:messageid => "324234234",
						:orderid => "1111999",
						:enduserid => "3289383838383",
						:notificationid => "10101010",
						:timestamp => "23432423423423",
					}
					},
					:version => "1.1"}
	
			get :index, body: params, use_route: :api_notification_v1_notifications

			puts response.body.inspect

		end
	end

end

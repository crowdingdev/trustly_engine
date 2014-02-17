require 'spec_helper'

module TrustlyEngine
	
	require_relative '../../../app/presenters/trustly_engine/withdrawal_presenter'

	describe WithdrawalPresenter do



		before(:each) do

			TrustlyEngine.configure do |config|
				config.trustly_public_key_path = File.expand_path('../../../../', __FILE__)  + "/certs/trustly_public_key.pem"
				config.merchant_private_key_path = File.expand_path('../../../../', __FILE__)  + "/certs/private.pem"
				config.api_base_path = "https://test.trustly.com/api/1"
			end
		end

		it "is returning a valid json" do 

			withdrawal_request = FactoryGirl.create(:trustly_engine_request)

			json = WithdrawalPresenter.new(withdrawal_request).as_json_rpc
			
			puts json
			expect { JSON.parse(json) }.to_not raise_error

		end

	end
end

require 'spec_helper'

module TrustlyEngine
	
	require_relative '../../../app/presenters/trustly_engine/withdrawal_presenter'

	describe WithdrawalPresenter do

		it "is returning a valid json" do 

		withdrawal_request = FactoryGirl.create(:trustly_engine_request)

    	json = WithdrawalPresenter.new(withdrawal_request).as_json_rpc
    	puts json
    	expect { JSON.parse(json) }.to_not raise_error

    end

end
end

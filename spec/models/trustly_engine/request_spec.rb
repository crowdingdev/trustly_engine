require 'spec_helper'

module TrustlyEngine
	describe Request do

		it "is valid" do

			expect( FactoryGirl.create(:trustly_engine_request) ).to have(0).errors_on(:trustly_engine_request)
			
		end
	end
end
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
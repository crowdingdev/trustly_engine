#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'
require 'net/http'
#require 'webmock/test_unit'
require 'active_support'

include TrustlyEngine

describe WithdrawalMethods do

	describe "serialize_data" do 

		before(:each) do

			TrustlyEngine.configure do |config|
				config.trustly_public_key_path = File.expand_path('../../../', __FILE__)  + "/certs/trustly_public_key.pem"
				config.merchant_private_key_path = File.expand_path('../../../', __FILE__)  + "/certs/private.pem"
				config.api_base_path = "https://test.trustly.com/api/1"
			end

		end

		it "is checking api_base_path" do
			expect(TrustlyEngine.config.api_base_path).to eq "https://test.trustly.com/api/1"
		end

		it "is making a withdrawal" do 

			 pending "create test for withdrawal"

		end

		it "is approving withdrawal" do 

			 pending "create test for approve withdrawal"

		end

		it "is denying a withdrawal" do 

			 pending "create test for deny withdrawal"

		end
	end
end

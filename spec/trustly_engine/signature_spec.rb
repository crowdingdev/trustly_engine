#!/bin/env ruby
# encoding: utf-8

require 'spec_helper'
require 'net/http'
#require 'webmock/test_unit'
require 'active_support/core_ext'

include TrustlyEngine

describe Signature do

	describe "serialize_data" do 

		it "returns object serialized and sorted in asciibetical order" do

			raw_string = '{"MyKey":"MyValue","MyArray":["Element1","Element2",{"mykey2":"myvalue2"}]}'
			
			json = JSON[raw_string]

			serialized_object = Signature::serialize_data(json)

			expect(serialized_object.kind_of?(String)).to be_true

			expect(serialized_object).to eq "MyArrayElement1Element2mykey2myvalue2MyKeyMyValue"

		end

		it "returns object serialized and sorted in asciibetical order (more complex version)" do

			raw_string = {
				:Username => 'MYUSERNAME',
				:Password => "MYPASSWORD", 
				:NotificationURL => "http:\/\/localhost:8080\/rest\/payment\/trustly\/withdraw",
				:EndUserID => "12345",
				:MessageID  => "This is my messageID trustlytest1121",
				#:Amount => "900.00" ,
				:Currency => "EUR",
				:Attributes => {
					:ClearingHouse => "SPAIN", 
					:BankNumber => "327",
					:AccountNumber => "048832662", 
					:Locale => "es_ES",
					:country => "ES",
					:IP => "83.140.44.184",
					:MobilePhone => "+46709876543",
					:Firstname => "Steve",
					:Lastname => "Smith",
					:NationalIdentificationNumber => "790131-1234",
					:Address => "Birgerstreet, 14, SE-11411, Stockholm" 
				}
				}.to_json


				json = JSON[raw_string.to_s]

				serialized_object = Signature::serialize_data(json)

				expect(serialized_object.kind_of?(String)).to be_true

				expect(serialized_object.to_s).to eq "AttributesAccountNumber048832662AddressBirgerstreet, 14, SE-11411, StockholmBankNumber327ClearingHouseSPAINFirstnameSteveIP83.140.44.184LastnameSmithLocalees_ESMobilePhone+46709876543NationalIdentificationNumber790131-1234countryESCurrencyEUREndUserID12345MessageIDThis is my messageID trustlytest1121NotificationURLhttp://localhost:8080/rest/payment/trustly/withdrawPasswordMYPASSWORDUsernameMYUSERNAME"

			end 
		end

		describe "sign" do 

			before(:each) do

				TrustlyEngine.configure do |config|
					config.trustly_public_key_path = File.expand_path('../../../', __FILE__)  + "/certs/trustly_public_key.pem"
					config.merchant_private_key_path = File.expand_path('../../../', __FILE__)  + "/certs/private.pem"
				end

			end

			it "creating a Signature for the trustly request" do

				expect(Signature::sign("withdrawal","7c5afd60-485c-0131-8181-38f6b113f7f9",JSON['{"MyKey":"MyValue","MyArray":["Element1","Element2",{"mykey2":"myvalue2"}]}']).kind_of?(String)).to be_true 

			end
		end

		describe "verify" do 

			it "should rerturn false (not correct inputs)" do


				expect(Signature::verify("withdrawal", "7c5afd60-485c-0131-8181-38f6b113f7f9", JSON['{"MyKey":"MyValue","MyArray":["Element1","Element2",{"mykey2":"myvalue2"}]}'], "dsfsffddsf")).to be_false

			end
		end
	end

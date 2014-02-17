require "trustly_engine/engine"
require "trustly_engine/signature"
require "trustly_engine/withdrawal_methods"
require "active_support"
require "httparty"

module TrustlyEngine

	include TrustlyEngine::Signature
	include TrustlyEngine::WithdrawalMethods
#	include HTTParty

	def self.configure(&block)
		yield @config ||= TrustlyEngine::Configuration.new
	end

	def self.config
		@config
	end

	class Configuration
		
		include ActiveSupport::Configurable
		config_accessor :trustly_public_key_path, :merchant_private_key_path, :api_base_path, :username, :password
	end

end
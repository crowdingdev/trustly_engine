module TrustlyEngine
	module WithdrawalMethods
		
		# include HTTParty
		
		# TODO: Add as a config or figaro env key.
		# base_uri 'https://test.trustly.com/api/1'

		def approve_withdrawal (data)
			return TrustlyEngine.config.api_base_path
			return requestor('ApproveWithdrawal', data)
		end

		def deny_withdrawal (data)

			return requestor('DenyWithdrawal', data)

		end

		def withdrawal (data) 
			
			return requestor('Withdraw', data)
		end

		# private

		def requestor(method, data)

			request_obj = {:body => data, :headers => { 'Content-Type' => 'application/json' } }
			
			puts "\n\n #### request object"
			puts request_obj[:body]

			result = HTTParty.post(TrustlyEngine.config.api_base_path, request_obj)
			return result

		end
		
	end
	
end


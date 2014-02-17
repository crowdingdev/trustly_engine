module TrustlyEngine

	module WithdrawalMethods
		
		#include HTTParty
		

		# TODO: Add as a config or figaro env key.
		#base_uri 'https://test.trustly.com/api/1'


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


		private

		def requestor(method, data)

			#request_object = JSONRPCObject.new(method, data)

			#result = self.class.post('/', request_object.options)

			#puts result
			#r = JSONRPCResult.new(result)
			#puts r.inspect
			#return r

		end
		
	end
	
end


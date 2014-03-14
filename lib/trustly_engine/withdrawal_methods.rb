module TrustlyEngine
	module WithdrawalMethods

		def withdrawal (data) 
			return requestor(data)
		end

		def requestor(data)

			request_obj = {:body => data, :headers => { 'Content-Type' => 'application/json' } }
			
			puts "\n\n #### request object"
			puts request_obj[:body]

			return HTTParty.post(TrustlyEngine.config.api_base_path, request_obj)

		end

	end
end
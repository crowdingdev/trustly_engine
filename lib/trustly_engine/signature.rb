module TrustlyEngine

	module Signature

		def serialize_data(object)

			serialized = ''

			if object.kind_of?(Hash) 

				object.sort{|x,y| x.to_s <=> y.to_s}.each do |key, value|

					serialized += key + serialize_data(value)
				end

			elsif object.kind_of?(Array)

				return object.map{|x| x.kind_of?(String) ? x : serialize_data(x) }.sort{|x,y| x.to_s <=> y.to_s}.join()
			else
				return object
			end

			return serialized
		end


		def sign(method, uuid, data)

			path = TrustlyEngine.config.merchant_private_key_path
			private_key = OpenSSL::PKey::RSA.new(File.read(path))
			plaintext = method + uuid + serialize_data(data)

			return Base64.encode64(private_key.sign(OpenSSL::Digest::SHA1.new, plaintext))
		end


		def verify(method, uuid, data, signature_from_trustly)

			path = TrustlyEngine.config.trustly_public_key_path
			trustly_public_key = OpenSSL::PKey::RSA.new(File.read(path))
			plaintext = method + uuid + serialize_data(data)

			return trustly_public_key.verify(OpenSSL::Digest::SHA1.new, Base64.decode64(signature_from_trustly), plaintext)
		end

	end
end
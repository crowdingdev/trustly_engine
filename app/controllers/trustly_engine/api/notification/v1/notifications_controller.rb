module TrustlyEngine
	module Api
		module Notification
			module V1
				class NotificationsController < ActionController::Base
					
					def index

						@result = Result.new
						#@result 

						render :json => {:result => "dodod", :r => params}
					end

				end
			end
		end
	end
end
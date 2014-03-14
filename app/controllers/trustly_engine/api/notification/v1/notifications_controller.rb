module TrustlyEngine
	module Api
		module Notification
			module V1
				class NotificationsController < ActionController::Base
					
					def index

						@request = Request.new
							
						@request.parse_notification(params)
						
						if @request.save
							#render :json => @request
							render :json => TrustlyEngine::ResultPresenter.new(@request).as_json_rpc

						end					
					end

				end
			end
		end
	end
end
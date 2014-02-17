require_dependency "trustly_engine/application_controller"

module TrustlyEngine
  class WithdrawalsController < ApplicationController
    def approve
    	@request = Request.find(params[:withdrawal_id])
    	redirect_to :back, notice: "Approved withdrawal #{@request.id}"
    end
  
    def deny

    	@request = Request.find(params[:withdrawal_id])
    	redirect_to :back, notice: "Denied withdrawal #{@request.id}"

    end
  end
end

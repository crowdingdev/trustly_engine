require_dependency "trustly_engine/application_controller"

module TrustlyEngine
  class TransactionsController < ApplicationController
    
    def index
    	@transactions = Request.all
    end
  
    def show
    end
  end
end

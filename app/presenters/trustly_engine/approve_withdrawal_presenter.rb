module TrustlyEngine
	class ApproveWithdrawalPresenter

		include TrustlyEngine::Signature

		attr_reader :resource

    # Takes a Request model
    def initialize( resource )
    	@resource = resource
    end

    def as_json_rpc

    	{ 
    		:method => "ApproveWithdrawal", 
    		:params => {
    			:Signature => 
    			sign("ApproveWithdrawal", @resource.uuid, JSON[self.data.to_json.to_s]), 
    			:UUID => @resource.uuid, 
    			:Data => self.data,
    			},
    			:version => '1.1'
    			}.to_json

    		end

    		def data

    			{
    				:OrderID => @resource.order_id,
    				:Password => "change_this_NNNh6RxQhz",
    				:Username => "crowding_test",
    				:Attributes => ""
    			}

    		end
    	end
    end


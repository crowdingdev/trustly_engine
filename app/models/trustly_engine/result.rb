#!/bin/env ruby
# encoding: utf-8
module TrustlyEngine
	class Result < ActiveRecord::Base
    include TrustlyEngine::Signature

    attr_accessible :signature, :uuid, :method, :order_id, :url

    belongs_to :request

    validates :signature, :presence => true
    validates :uuid, :presence => true
    validates :order_id, :presence => true
    validates :url, :presence => true
    validates :method, :presence => true
    validates :method, inclusion: { in: %w( Withdraw debit ApproveWithdrawal DenyWithdrawal),  message: "%{value} is not an accepted method." }

    after_initialize :set_defaults


    #validate :check_signature

    def check_signature(data)

      if !verify(self.method, self.uuid, data, self.signature)
        raise SecurityException
      end
    end

    def set_defaults

    	if self.new_record?

    		self.request = Request.find_by_uuid(self.uuid)
    		self.save(:validate => false)
    		
    	end
    end

    def status
      
    end

    # Used to parse result from withdrawal approve and denied methods
    #def parse_result_json_rpc(result = nil)
      
      #self.order_id = result["result"]["data"]["orderid"]
      #self.signature = result["result"]["signature"]
      #self.method = request["result"]["method"]
      #self.result = result["result"]["data"]["result"]

      #check_signature(result["result"]["data"])

      #self.save

    #end

    # Used to respond when trustly sends notification
    def parse_json(request = nil)
      
      self.order_id = request["result"]["data"]["orderid"]
      self.url = request["result"]["data"]["url"]
      self.method = request["result"]["method"]
      
      self.signature = request["result"]["signature"]      
      self.uuid = request["result"]["uuid"]

      self.save

    end
  end
end





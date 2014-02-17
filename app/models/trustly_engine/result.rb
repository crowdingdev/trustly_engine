module TrustlyEngine
	class Result < ActiveRecord::Base
    attr_accessible :signature, :uuid, :method, :order_id, :url
    
    belongs_to :request

    validates :signature, :presence => true
    validates :uuid, :presence => true
    validates :order_id, :presence => true
    validates :url, :presence => true
    validates :method, :presence => true
    validates :method, inclusion: { in: %w(Withdraw),  message: "%{value} is not an accepted method." }

    after_initialize :set_defaults

    def set_defaults

    	if self.new_record?

    		self.request = Request.find_by_uuid(self.uuid)
    		self.save(:validate => false)
    		
    	end
    end
end
end

module TrustlyEngine
  class Request < ActiveRecord::Base
    
    attr_accessible :uuid, :user_id, :locale, :currency, :amount, :first_name, :country,
    :last_name, :ip, :phone_number, :nin, :address, :signature, :method #, :status_id
    
    has_many :results

    after_initialize :set_defaults

    validates :uuid, :presence => true
    validates :user_id, :presence => true
    validates :locale, :presence => true
    validates :country, :presence => true
    validates :currency, :presence => true

    # validates :description, length: {maximum: 5000, minimum: 140}, :unless => :new_record?
    # validates :title, length: {maximum: 50, minimum: 3}

    validates :currency, inclusion: { in: %w(SEK BGP USD EUR),  message: "%{value} is not an accepted currency." }
    validates_numericality_of :amount, :greater_than => 0.00, :less_than => 100000

    def set_defaults

         if self.new_record?

              self.uuid = UUID.new.generate

         end
    end

    def message_id
      self.user_id.to_s + "_" + self.created_at.to_i.to_s
    end

  

    def status
        [:initiated,:user_processed][self.status_id || 0] 
       #status_ids: 0 => initated (default), 1 => user-proccessed, 2 => admin-denied, 3 => admin-approved
    end

  end
end

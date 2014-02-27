module TrustlyEngine
  class Request < ActiveRecord::Base
    
    attr_accessible :uuid, :user_id, :locale, :currency, :amount, :first_name, :country,
    :last_name, :ip, :phone_number, :nin, :address, :signature, :method #, :status_id
    
    has_many :results

    after_initialize :set_defaults

    #validates :order_id, :presence => true

    validates :uuid, :presence => true
    validates :user_id, :presence => true

    validates :locale, :presence => true
    validates :country, :presence => true
    validates :currency, :presence => true

    # validates :description, length: {maximum: 5000, minimum: 140}, :unless => :new_record?
    # validates :title, length: {maximum: 50, minimum: 3}

    validates :currency, inclusion: { in: %w(SEK BGP USD EUR),  message: "%{value} is not an accepted currency." }
    validates_numericality_of :amount, :greater_than => 100.00, :less_than => 10000.00

    def set_defaults

         if self.new_record?
              status_id = 0
              self.uuid = UUID.new.generate
         end
    end

    def message_id
      super || self.user_id.to_s + "_" + self.created_at.to_i.to_s
    end


    def status
        [:initiated,:user_processed][self.status_id || 0] 
       #status_ids: 0 => initated (default), 1 => user-proccessed, 2 => admin-denied, 3 => admin-approved
    end


    
    def parse_notification(notification = nil)
      
      params = notification["params"]
      data = notification["params"]["data"]



      self.method = notification["method"]
      # params
      self.signature = params["signature"]
      self.uuid = params["uuid"]

      # data
      self.amount = data["amount"]
      self.currency = data["currency"]
      self.user_id = data["enduserid"]
      self.notification_id = data["notificationid"]
      self.user_id = data["orderid"]
      self.message_id = data["messageid"]

      self.save
    end

  end
end

#{
#    "method": "credit",
#    "params": {
#        "signature": "R9+hjuMqbsH0Ku ... S16VbzRsw==",
#        "uuid": "258a2184-2842-b485-25ca-293525152425",
#        "data": {
#            "amount": "902.50",
#            "currency": "EUR",
#            "messageid": "98348932",
#            "orderid": "87654567",
#            "enduserid": "32123",
#            "notificationid": "9876543456",
#            "timestamp": "2010-01-20 14:42:04.675645+01",
#            "attributes": {}
#        }
#    },
#    "version": "1.1"
#}


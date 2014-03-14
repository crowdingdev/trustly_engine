#!/bin/env ruby
# encoding: utf-8
module TrustlyEngine
  class Request < ActiveRecord::Base
    include TrustlyEngine::Signature
    
    attr_accessible :uuid, :user_id, :locale, :currency, :amount, :first_name, :country,
    :last_name, :ip, :phone_number, :nin, :address, :signature, :method #, :status_id
    
    has_many :results

    after_initialize :set_defaults

    #validates :order_id, :presence => true

    validates :uuid, :presence => true
    validates :user_id, :presence => true

    #validates :locale, :presence => true
    #validates :country, :presence => true
    validates :currency, :presence => true

    # validates :description, length: {maximum: 5000, minimum: 140}, :unless => :new_record?
    # validates :title, length: {maximum: 50, minimum: 3}

    validates :currency, inclusion: { in: %w(SEK GBP USD EUR),  message: "%{value} is not an accepted currency." }
    validates_numericality_of :amount, :greater_than => 100.00, :less_than => 10000.00

    def set_defaults
      if self.new_record?
        status_id = 0
        #self.uuid = UUID.new.generate
      end
    end

    def message_id
      super || self.user_id.to_s + "_" + self.created_at.to_i.to_s
    end


    def status
      #[:initiated,:user_processed][self.status_id || 1] 

      #status_ids: 0 => initated (default), 1 => user-proccessed, 2 => admin-denied, 3 => admin-approved
    end

    # Sets the standard locale code for the specified country code.
    def locale

      super || get_locale_for_country(self.country) if self.method != "debit" && !self.country.nil?

    end

    
    # Used when recieving debit(etc) notifications from trustly.
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
      self.order_id = data["orderid"]
      self.message_id = data["messageid"]
      request_timestamp = data["timestamp"]

    check_signature(notification)

    end

    # If verification fails raise SecurityException else return true.
    def check_signature(data)
      #return Base64.decode64(data["params"]["signature"])
      #return signature = sign(self.method, self.uuid, JSON[data.to_json.to_s])
      #return serialize_data(JSON[data["params"]["data"].to_json.to_s])
      #return {m: data["method"], uuid: data["params"]["uuid"], data: JSON[data["params"]["data"].to_json.to_s], s: data["params"]["signature"]}
      #return data["params"]["signature"] 
      
      return verify(data["method"], data["params"]["uuid"], JSON[data["params"]["data"].to_json.to_s], data["params"]["signature"])

      if !verify(self.method, self.uuid, JSON[data.to_json.to_s], self.signature)
        raise SecurityException
      end

      return true

    end


    private 
    def get_locale_for_country(c = "SE")

      l = {
          "SE" => "sv_SE", # sweden
          "DK" => "da_DK", # danish
          "DE" => "de_DE", # germany
          "EE" => "et_EE", # eesti
          "GB" => "en_GB", # english
          "US" => "en_US", # United States
          "ES" => "es_ES", # espanol
          "FR" => "fr_FR", # francais
          "IT" => "it_IT", # italiano
          "NO" => "no_NO", # norsk
          "PL" => "pl_PL", # polsk
          "fi" => "fi_FI"  # soumi
          }[c.upcase]

          return l.nil? ? "en_US" : l

        end

      end
    end

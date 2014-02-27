module TrustlyEngine
  class WithdrawalPresenter

    include TrustlyEngine::Signature

    attr_reader :resource

    def initialize( resource )
      @resource = resource
    end

    def as_json_rpc

      { 
        :method => "Withdraw", 
        :params => {
          :Signature => 
          
          sign("Withdraw", @resource.uuid, JSON[self.data.to_json.to_s]), 
          
          :UUID => @resource.uuid, 
          :Data => self.data,
          },:version => '1.1'
          }.to_json

        end

        def data

          {
            :NotificationURL => "http://54.72.31.10/", 
            :EndUserID => @resource.user_id.to_s,
            :MessageID => @resource.message_id,
            :Currency => @resource.currency,
            :Password => "change_this_NNNh6RxQhz",
            :Username => "crowding_test",
            :Attributes => {
              :ClearingHouse => "",
              :BankNumber => "",
              :AccountNumber => "",
              :SuggestedAmount => sprintf('%.2f', @resource.amount).to_s,
          :SuggestedMinAmount => "", #sprintf('%.2f', @resource.amount).to_s,
          :SuggestedMaxAmount => "", #sprintf('%.2f', @resource.amount).to_s,
          :Locale => @resource.locale,
          :Country => @resource.country || "",
          :IP => @resource.ip,
          :MobilePhone => @resource.phone_number || "",
          :Firstname => @resource.first_name || "",
          :Lastname => @resource.last_name || "",
          :Address => @resource.address || "d sfsdf dsdf fsdf sa",
          :URLTarget => "_top",
          :SuccessURL => "http://example.com/wallet/",
          :FailURL => "http://example.com/wallet/" 
        }
      }

    end
  end
end

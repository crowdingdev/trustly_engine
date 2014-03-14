module TrustlyEngine
  class WithdrawalPresenter

    include TrustlyEngine::Signature

    attr_reader :resource

    # Takes a Request model
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
            :NotificationURL => ENV['TRUSTLY_NOTIFICATION_URL'], 
            :EndUserID => @resource.user_id.to_s,
            :MessageID => @resource.message_id,
            :Currency => @resource.currency,
            :Password => ENV['TRUSTLY_PASSWORD'],
            :Username => ENV['TRUSTLY_USERNAME'],
            :Attributes => {
              :SuggestedAmount => sprintf('%.2f', @resource.amount).to_s,
              :Locale => @resource.locale,
              :Country => @resource.country,
              :IP => @resource.ip,
              :Firstname => @resource.first_name || "",
              :Lastname => @resource.last_name || "",
              :TemplateURL => "http://82.196.14.209/wallet/withdrawals/",
              :URLTarget => "_parent",
              :SuccessURL => "http://82.196.14.209/wallet/withdrawals/success",
              :FailURL => "http://82.196.14.209/wallet/withdrawals/failed" 
            }
          }

        end
      end
    end


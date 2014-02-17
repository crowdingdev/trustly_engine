module TrustlyEngine

 class WithdrawalPresenter

  attr_reader :resource

  def initialize( resource )
    @resource = resource
  end

  def as_json_rpc

    { 
      :method => "Withdraw", 
      :params => {
        :Signature => @resource.signature, 
        :UUID => @resource.uuid, 
        :Data => {
            :NotificationUrl => "/" + @resource.id.to_s, #use a namespace route like withdrawal_url(@resource)
            :EndUserID => @resource.user_id,
            :MessageID => @resource.message_id,
            :Currency => @resource.currency,
            :Attributes => {
              :ClearingHouse => "",
              :BankNumber => "",
              :AccountNumber => "",
              :SuggestedAmount => sprintf('%.2f', @resource.amount),
              :SuggestedMinAmount => sprintf('%.2f', @resource.amount),
              :SuggestedMaxAmount => sprintf('%.2f', @resource.amount),
              :Locale => @resource.locale,
              :Country => @resource.country || "",
              :IP => @resource.ip,
              :MobilePhone => @resource.phone_number || "",
              :Firstname => @resource.first_name || "",
              :Lastname => @resource.last_name || "",
              :Address => @resource.address || "",
              :URLTarget => "_top",
              :SuccessURL => "/",
              :FailURL => "/" 
            }
            },
            :version => '1.1' 
          }
          }.to_json

        end

      end

    end

module TrustlyEngine

 class ResultPresenter

  attr_reader :resource

  def initialize( resource )
    @resource = resource
  end

  def as_json_rpc

    { 
      :result => {
      :signature => @resource.signature,
      :uuid => @resource.uuid,
      :method => @resource.method,
      :data => {
      }
      },
      :version => "1.1"

      }.to_json

    end

  end

end
#{
#    "result": {
#        "signature": "R9+hjuMqbsH0Ku ... S16VbzRsw==",
#        "uuid": "258a2184-2842-b485-25ca-293525152425",
#        "method": "credit",
#        "data": {
#            "status": "..."
#        }
#    },
#    "version":"1.1"
#}
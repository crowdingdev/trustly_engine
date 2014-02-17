class CreateTrustlyEngineResults < ActiveRecord::Migration
  def change
    create_table :trustly_engine_results do |t|
    	
    	t.string :signature
    	t.string :uuid
    	t.string :method
    	t.string :order_id
    	t.string :result
    	t.string :url

    	t.references :request

      	t.timestamps
    end
  end
end



#{
#    "result": {
#        "signature": "R9+hjuMqbsH0Ku ... S16VbzRsw==",
#        "uuid": "258a2184-2842-b485-25ca-293525152425",
#        "method": "Withdraw",
#        "data": {
#            "orderid": "2190971587",
#            "url": "https://trustly.com/_/2f6b14fa-446a-4364-92f8-84b738d589ff"
#        }
#    },
#    "version": "1.1"
#}
module TrustlyEngine
	class Result < ActiveRecord::Base
    attr_accessible :signature, :uuid, :method, :order_id, :url

    belongs_to :request

    validates :signature, :presence => true
    validates :uuid, :presence => true
    validates :order_id, :presence => true
    validates :url, :presence => true
    validates :method, :presence => true
    validates :method, inclusion: { in: %w( Withdraw debit ),  message: "%{value} is not an accepted method." }

    after_initialize :set_defaults

    def set_defaults

    	if self.new_record?

    		self.request = Request.find_by_uuid(self.uuid)
    		self.save(:validate => false)
    		
    	end
    end





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


#{
#    "result": {
#        "data": {
#            "orderid": "2026756229",
#            "url": "https://test.trustly.com/_/withdraw.php?SessionID=c9ffe756-6198-4dcd-8790-684a587ed961&OrderID=2026756229&Locale=sv_SE"
#        },
#        "method": "Withdraw",
#        "signature": "rz8s4zssh5syosLhFvxt9vdRez4N4uksZuGhKWL5ZI8elVfC8z+iQE+QAdUrrjl2i9hLXzHoUHXlw83QkXHodG91qlj0sBRhXhYOSxfuvOd9yUioLYLJaXOawQpFFZOraMLB8dZf7TdIiiiCB7NcRucOQ5kLvrEnVYuXS9ovxJ54aerzakuV3ynMDb4dQ1JTPgveIAFNM53NQKGIaJNYQFWyqBhUA01HFwoOQ+Pu+uN+k9hk6E6uS3mFC7u+M9Ev0AV8sFNFMWb+YAREUaxwXHPxLQLIyxwjSJ+u9G/KTDMqChpEmml9G9rbHmvdujtdz3BJ71CbKJU/qHN9sZRRQQ==",
#        "uuid": "c6c6a220-8119-0131-676b-38f6b113f7f9"
#    },
#    "version": "1.1"
#}
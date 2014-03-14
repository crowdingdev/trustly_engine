TrustlyEngine::Engine.routes.draw do

	resources :withdrawals, :only => [] do
		post "approve", :to => "withdrawals#approve"
		post "deny", :to => "withdrawals#deny"
	end
	
	#namespace :api do
	#	namespace :notification do
	#		namespace :v1 do
	
  #  		post "notifications", :to => "notifications#index"#, :protocol => "https"
  
  #  	end
  #  end
	#end


end

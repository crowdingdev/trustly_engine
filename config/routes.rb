TrustlyEngine::Engine.routes.draw do

  root :to => "transactions#index"

  resources :withdrawals, :only => [] do
  	  post "approve", :to => "withdrawals#approve"
  	  post "deny", :to => "withdrawals#deny"
  end

end

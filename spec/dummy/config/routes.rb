Rails.application.routes.draw do

  mount TrustlyEngine::Engine => "/trustly_engine"
end

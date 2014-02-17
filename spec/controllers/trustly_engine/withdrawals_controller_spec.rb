require 'spec_helper'

module TrustlyEngine
  describe WithdrawalsController do
  
    describe "GET 'approve'" do
      it "returns http success" do
        get 'approve'
        response.should be_success
      end
    end
  
    describe "GET 'deny'" do
      it "returns http success" do
        get 'deny'
        response.should be_success
      end
    end
  
  end
end

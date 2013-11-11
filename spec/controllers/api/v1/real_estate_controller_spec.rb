require 'spec_helper'

describe Api::V1::RealEstateController do

  describe "GET 'around'" do
    it "returns http success" do
      get 'around'
      response.should be_success
    end
  end

end

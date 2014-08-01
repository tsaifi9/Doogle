require 'spec_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "POST create" do
    it "returns correct http codes" do
      post :create, {word: {value: "test"}}
      expect(response).to be_success
    end
  end

end

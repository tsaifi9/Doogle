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

      #invalid callbacks
      post :create, {word: {value: "invalid!"}}
      expect(response).to_not be_success

      post :create, {word: {value: ""}}
      expect(response).to_not be_success

      #valid callbacks
      post :create, {word: {value: "test"}}
      expect(response).to be_success

      post :create, {word: {value: "I'm"}}
      expect(response).to be_success

      post :create, {word: {value: "ice-skate"}}
      expect(response).to be_success

    end
  end
end

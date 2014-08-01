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
      post :create, {word: {word: "invalid!"}}
      expect(response).to_not be_success

      post :create, {word: {word: ""}}
      expect(response).to_not be_success

      #valid callbacks
      post :create, {word: {word: "test"}}
      expect(response).to be_success

      post :create, {word: {word: "I'm"}}
      expect(response).to be_success

      post :create, {word: {word: "ice-skate"}}
      expect(response).to be_success

    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::Customers::FavoriteMerchantController, type: :controller do
  fixtures :invoices, :customers, :transactions, :merchants
  describe "#index" do
    it "serves a customers' favorite merchant' json" do
      get :index, format: :json, customer_id: customers(:customer_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["id"]).to eq merchants(:merchant_1).id
      expect(body["name"]).to eq merchants(:merchant_1).name
    end
  end
end

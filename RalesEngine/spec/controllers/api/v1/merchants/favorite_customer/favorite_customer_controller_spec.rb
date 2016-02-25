require 'rails_helper'

RSpec.describe Api::V1::Merchants::FavoriteCustomerController, type: :controller do
  fixtures :invoices, :customers, :transactions, :merchants
  describe "#index" do
    it "serves a customers' favorite merchant' json" do
      get :index, format: :json, merchant_id: merchants(:merchant_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["id"]).to eq customers(:customer_1).id
      expect(body["first_name"]).to eq customers(:customer_1).first_name
      expect(body["last_name"]).to eq customers(:customer_1).last_name
    end
  end
end

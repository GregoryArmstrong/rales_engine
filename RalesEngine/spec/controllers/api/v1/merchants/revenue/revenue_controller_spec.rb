require 'rails_helper'

RSpec.describe Api::V1::Merchants::RevenueController, type: :controller do
  fixtures :merchants, :invoices, :invoice_items, :items, :transactions
  describe "#index" do
    it "serves all merchants' revenue json" do
      get :index, format: :json, merchant_id: merchants(:merchant_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["revenue"]).to eq "150212.0"
    end

    it "serves all merchants' revenue by date json" do
      get :index, format: :json, merchant_id: merchants(:merchant_1).id, date: "2012-03-26 14:54:09"

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["revenue"]).to eq nil
    end
  end
end

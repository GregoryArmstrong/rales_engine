require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do
  fixtures :invoices, :merchants
  describe "#index" do
    it "serves all an invoices' merchants' json" do
      get :index, format: :json, invoice_id: invoices(:invoice_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq merchants(:merchant_1).name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::Invoices::ItemsController, type: :controller do
  fixtures :items, :invoice_items, :invoices
  describe "#index" do
    it "serves all an invoices' items' json" do
      get :index, format: :json, invoice_id: invoices(:invoice_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item_1).name
      expect(first_item["description"]).to eq items(:item_1).description
      expect(first_item["unit_price"]).to eq items(:item_1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item_1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
    end
  end
end

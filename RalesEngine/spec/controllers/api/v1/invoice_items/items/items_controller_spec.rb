require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do
  fixtures :items, :invoice_items, :invoices
  describe "#index" do
    it "serves all an invoice_items' items' json" do
      get :index, format: :json, invoice_item_id: invoice_items(:invoice_item_2).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)


      expect(body["name"]).to eq items(:item_1).name
      expect(body["description"]).to eq items(:item_1).description
      expect(body["unit_price"]).to eq items(:item_1).unit_price.to_s
      expect(body["merchant_id"]).to eq items(:item_1).merchant_id
      expect(body["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
    end
  end
end

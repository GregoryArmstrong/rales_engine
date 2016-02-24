require 'rails_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :controller do
  fixtures :items, :invoice_items, :invoices
  describe "#index" do
    it "serves all an items' invoice_items' json" do
      get :index, format: :json, item_id: items(:item_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice_item = body.first

      expect(first_invoice_item["item_id"]).to eq invoice_items(:invoice_item_2).item_id
      expect(first_invoice_item["invoice_id"]).to eq invoice_items(:invoice_item_2).invoice_id
      expect(first_invoice_item["quantity"]).to eq invoice_items(:invoice_item_2).quantity
      expect(first_invoice_item["unit_price"]).to eq invoice_items(:invoice_item_2).unit_price
      expect(first_invoice_item["created_at"]).to eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["updated_at"]).to eq "2012-03-27T14:54:11.000Z"
    end
  end
end

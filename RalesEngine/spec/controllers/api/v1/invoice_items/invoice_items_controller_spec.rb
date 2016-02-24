require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  fixtures :invoice_items
  describe "#index" do
    it "serves all invoice_items' json" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice_item = body.first
      second_invoice_item = body.last

      expect(first_invoice_item["item_id"]).to eq invoice_items(:invoice_item_1).item_id
      expect(first_invoice_item["invoice_id"]).to eq invoice_items(:invoice_item_1).invoice_id
      expect(first_invoice_item["quantity"]).to eq invoice_items(:invoice_item_1).quantity
      expect(first_invoice_item["unit_price"]).to eq invoice_items(:invoice_item_1).unit_price
      expect(first_invoice_item["created_at"]).to eq "2012-03-27T14:54:11.000Z"
      expect(first_invoice_item["updated_at"]).to eq "2012-03-27T14:54:11.000Z"
      expect(second_invoice_item["item_id"]).to eq invoice_items(:invoice_item_2).item_id
      expect(second_invoice_item["invoice_id"]).to eq invoice_items(:invoice_item_2).invoice_id
      expect(second_invoice_item["quantity"]).to eq invoice_items(:invoice_item_2).quantity
      expect(second_invoice_item["unit_price"]).to eq invoice_items(:invoice_item_2).unit_price
      expect(second_invoice_item["created_at"]).to eq "2012-03-27T14:54:11.000Z"
      expect(second_invoice_item["updated_at"]).to eq "2012-03-27T14:54:11.000Z"
    end
  end

  describe "#show" do
    it "serves one invoice_items' json" do
      get :show, format: :json, id: invoice_items(:invoice_item_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["item_id"]).to eq invoice_items(:invoice_item_1).item_id
      expect(body["invoice_id"]).to eq invoice_items(:invoice_item_1).invoice_id
      expect(body["quantity"]).to eq invoice_items(:invoice_item_1).quantity
      expect(body["unit_price"]).to eq invoice_items(:invoice_item_1).unit_price
      expect(body["created_at"]).to eq "2012-03-27T14:54:11.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:11.000Z"
    end
  end
end

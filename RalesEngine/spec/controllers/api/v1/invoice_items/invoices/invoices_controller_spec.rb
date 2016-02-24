require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::InvoicesController, type: :controller do
  fixtures :items, :invoice_items, :invoices
  describe "#index" do
    it "serves all an invoice_items' invoices' json" do
      get :index, format: :json, invoice_item_id: invoice_items(:invoice_item_2).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      # first_invoice = body.first

      expect(body["customer_id"]).to eq invoices(:invoice_1).customer_id
      expect(body["merchant_id"]).to eq invoices(:invoice_1).merchant_id
      expect(body["status"]).to eq invoices(:invoice_1).status
      expect(body["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end
  end
end

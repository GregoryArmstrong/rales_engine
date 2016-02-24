require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do
  fixtures :invoices
  describe "#index" do
    it "serves all items' json" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_invoice = body.first
      second_invoice = body.last

      expect(first_invoice["customer_id"]).to eq invoices(:invoice_1).customer_id
      expect(first_invoice["merchant_id"]).to eq invoices(:invoice_1).merchant_id
      expect(first_invoice["status"]).to eq invoices(:invoice_1).status
      expect(first_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(second_invoice["customer_id"]).to eq invoices(:invoice_2).customer_id
      expect(second_invoice["merchant_id"]).to eq invoices(:invoice_2).merchant_id
      expect(second_invoice["status"]).to eq invoices(:invoice_2).status
      expect(second_invoice["created_at"]).to eq "2012-03-23T02:58:15.000Z"
      expect(second_invoice["updated_at"]).to eq "2012-03-23T02:58:15.000Z"
    end
  end

  describe "#show" do
    it "serves a single invoices' json" do
      get :show, format: :json, id: invoices(:invoice_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["customer_id"]).to eq invoices(:invoice_1).customer_id
      expect(body["merchant_id"]).to eq invoices(:invoice_1).merchant_id
      expect(body["status"]).to eq invoices(:invoice_1).status
      expect(body["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do
  fixtures :invoices
  describe "#index" do
    it "serves all a merchants' invoices' json" do
      get :index, format: :json, merchant_id: 26
        invoice_3 = Invoice.create(customer_id: 921093900,
                                   merchant_id: 26,
                                   status: "shipped",
                                   created_at: "2012-03-25 09:54:09",
                                   updated_at: "2012-03-25 09:54:09"
                                   )

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      first_invoice = body.first
      last_invoice = body.last

      expect(first_invoice["customer_id"]).to eq invoices(:invoice_1).customer_id
      expect(first_invoice["merchant_id"]).to eq invoices(:invoice_1).merchant_id
      expect(first_invoice["status"]).to eq invoices(:invoice_1).status
      expect(first_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(last_invoice["customer_id"]).to eq invoice_3.customer_id
      expect(last_invoice["merchant_id"]).to eq invoice_3.merchant_id
      expect(last_invoice["status"]).to eq invoice_3.status
      expect(last_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(last_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::Merchants::CustomersWithPendingInvoicesController, type: :controller do
  fixtures :invoices, :merchants, :transactions, :customers
  describe "#index" do
    it "serves all a merchants' pending invoices' json" do
      invoice_3 = Invoice.create(customer_id: customers(:customer_1).id,
                                 merchant_id: merchants(:merchant_1).id,
                                 status: "shipped",
                                 created_at: "2012-03-25 09:54:09",
                                 updated_at: "2012-03-25 09:54:09"
                                 )
      transaction_3 = Transaction.create(invoice_id: invoice_3.id,
                                         credit_card_number: 4580251236515201,
                                         result: 'failed',
                                         created_at: "2012-03-25 09:54:09",
                                         updated_at: "2012-03-25 09:54:09"
                                         )
      get :index, format: :json, merchant_id: merchants(:merchant_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      first_invoice = body.first

      expect(first_invoice["customer_id"]).to eq invoices(:invoice_1).customer_id
      expect(first_invoice["merchant_id"]).to eq invoices(:invoice_1).merchant_id
      expect(first_invoice["status"]).to eq invoices(:invoice_1).status
      expect(first_invoice["created_at"]).to eq "2012-03-25T09:54:09.000Z"
      expect(first_invoice["updated_at"]).to eq "2012-03-25T09:54:09.000Z"
    end
  end
end

require 'rails_helper'

RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do
  fixtures :invoices, :transactions
  describe "#index" do
    it "serves all a transactions' invoices' json" do
      invoice_3 = Invoice.create(customer_id: 921093900,
                                 merchant_id: 558182687,
                                 status: "shipped",
                                 created_at: "2012-03-25 09:54:09",
                                 updated_at: "2012-03-25 09:54:09"
                                 )
      get :index, format: :json, transaction_id: transactions(:transaction_2).id

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

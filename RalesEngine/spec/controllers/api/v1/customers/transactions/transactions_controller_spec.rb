require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do
  fixtures :transactions, :customers, :invoices
  describe "#index" do
    it "serves all of a customers' transactions' json" do
      invoice_3 = Invoice.create(customer_id: 921093900,
                                 merchant_id: 558182687,
                                 status: "shipped",
                                 created_at: "2012-03-25 09:54:09",
                                 updated_at: "2012-03-25 09:54:09"
                                 )
      invoice_4 = Invoice.create(customer_id: 921093900,
                                 merchant_id: 558182687,
                                 status: "shipped",
                                 created_at: "2012-03-25 09:54:10",
                                 updated_at: "2012-03-25 09:54:10"
                                 )
      transaction_3 = Transaction.create(invoice_id: invoice_3.id,
                                         credit_card_number: 4654405418249632,
                                         result: "success",
                                         created_at: "2012-03-27 14:54:09",
                                         updated_at: "2012-03-27 14:54:09"
                                         )
      transaction_4 = Transaction.create(invoice_id: invoice_4.id,
                                        credit_card_number: 4654405418249632,
                                        result: "success",
                                        created_at: "2012-03-27 14:54:09",
                                        updated_at: "2012-03-27 14:54:09"
                                        )

      get :index, format: :json, customer_id: 921093900

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      first_transaction = body.first
      last_transaction = body.last

      expect(first_transaction["invoice_id"]).to eq transaction_3.invoice_id
      expect(first_transaction["credit_card_number"]).to eq transaction_3.credit_card_number
      expect(first_transaction["result"]).to eq transaction_3.result
      expect(first_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(last_transaction["invoice_id"]).to eq transaction_4.invoice_id
      expect(last_transaction["credit_card_number"]).to eq transaction_4.credit_card_number
      expect(last_transaction["result"]).to eq transaction_4.result
      expect(last_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(last_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end

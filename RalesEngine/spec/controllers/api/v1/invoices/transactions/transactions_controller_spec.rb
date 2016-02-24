require 'rails_helper'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do
  fixtures :transactions
  describe "#index" do
    it "serves all an invoices' transactions' json" do
      get :index, format: :json, invoice_id: 1

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      first_transaction = body.first

      expect(first_transaction["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(first_transaction["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(first_transaction["result"]).to eq transactions(:transaction_1).result
      expect(first_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end

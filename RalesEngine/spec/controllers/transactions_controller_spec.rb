require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  fixtures :transactions
  describe "#index" do
    it "serves all transactions' json" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_transaction = body.first
      second_transaction = body.last

      expect(first_transaction["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(first_transaction["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(first_transaction["result"]).to eq transactions(:transaction_1).result
      expect(first_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(second_transaction["invoice_id"]).to eq transactions(:transaction_2).invoice_id
      expect(second_transaction["credit_card_number"]).to eq transactions(:transaction_2).credit_card_number
      expect(second_transaction["result"]).to eq transactions(:transaction_2).result
      expect(second_transaction["created_at"]).to eq "2012-03-26T14:54:09.000Z"
      expect(second_transaction["updated_at"]).to eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "serves on transactions' json" do
      get :show, format: :json, id: transactions(:transaction_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(body["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(body["result"]).to eq transactions(:transaction_1).result
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end

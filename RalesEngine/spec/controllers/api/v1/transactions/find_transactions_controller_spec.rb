require 'rails_helper'

RSpec.describe Api::V1::FindTransactionsController, type: :controller do
  fixtures :transactions
  describe "#index" do
    it "finds and serves all transactions' json by ID" do
      get :index, format: :json, id: transactions(:transaction_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_transaction = body.first

      expect(first_transaction["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(first_transaction["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(first_transaction["result"]).to eq transactions(:transaction_1).result
      expect(first_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["invoice_id"]).to_not eq transactions(:transaction_2).invoice_id
      expect(first_transaction["credit_card_number"]).to_not eq transactions(:transaction_2).credit_card_number
      expect(first_transaction["result"]).to_not eq transactions(:transaction_2).result
      expect(first_transaction["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all transactions' json by invoice_id" do
      get :index, format: :json, invoice_id: transactions(:transaction_1).invoice_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_transaction = body.first

      expect(first_transaction["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(first_transaction["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(first_transaction["result"]).to eq transactions(:transaction_1).result
      expect(first_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["invoice_id"]).to_not eq transactions(:transaction_2).invoice_id
      expect(first_transaction["credit_card_number"]).to_not eq transactions(:transaction_2).credit_card_number
      expect(first_transaction["result"]).to_not eq transactions(:transaction_2).result
      expect(first_transaction["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all transactions' json by credit_card_number" do
      get :index, format: :json, credit_card_number: transactions(:transaction_1).credit_card_number

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_transaction = body.first

      expect(first_transaction["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(first_transaction["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(first_transaction["result"]).to eq transactions(:transaction_1).result
      expect(first_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["invoice_id"]).to_not eq transactions(:transaction_2).invoice_id
      expect(first_transaction["credit_card_number"]).to_not eq transactions(:transaction_2).credit_card_number
      expect(first_transaction["result"]).to_not eq transactions(:transaction_2).result
      expect(first_transaction["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all transactions' json by result" do
      get :index, format: :json, result: transactions(:transaction_1).result

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_transaction = body.first

      expect(first_transaction["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(first_transaction["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(first_transaction["result"]).to eq transactions(:transaction_1).result
      expect(first_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["invoice_id"]).to_not eq transactions(:transaction_2).invoice_id
      expect(first_transaction["credit_card_number"]).to_not eq transactions(:transaction_2).credit_card_number
      expect(first_transaction["result"]).to_not eq transactions(:transaction_2).result
      expect(first_transaction["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all transactions' json by created_at" do
      get :index, format: :json, created_at: transactions(:transaction_1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_transaction = body.first

      expect(first_transaction["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(first_transaction["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(first_transaction["result"]).to eq transactions(:transaction_1).result
      expect(first_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["invoice_id"]).to_not eq transactions(:transaction_2).invoice_id
      expect(first_transaction["credit_card_number"]).to_not eq transactions(:transaction_2).credit_card_number
      expect(first_transaction["result"]).to_not eq transactions(:transaction_2).result
      expect(first_transaction["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all transactions' json by updated_at" do
      get :index, format: :json, updated_at: transactions(:transaction_1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_transaction = body.first

      expect(first_transaction["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(first_transaction["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(first_transaction["result"]).to eq transactions(:transaction_1).result
      expect(first_transaction["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_transaction["invoice_id"]).to_not eq transactions(:transaction_2).invoice_id
      expect(first_transaction["credit_card_number"]).to_not eq transactions(:transaction_2).credit_card_number
      expect(first_transaction["result"]).to_not eq transactions(:transaction_2).result
      expect(first_transaction["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_transaction["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "finds and serves one transactions' json by ID" do
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

    it "finds and serves one transactions' json by invoice_id" do
      get :show, format: :json, invoice_id: transactions(:transaction_1).invoice_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(body["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(body["result"]).to eq transactions(:transaction_1).result
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one transactions' json by credit_card_number" do
      get :show, format: :json, credit_card_number: transactions(:transaction_1).credit_card_number

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(body["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(body["result"]).to eq transactions(:transaction_1).result
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one transactions' json by result" do
      get :show, format: :json, result: transactions(:transaction_1).result

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(body["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(body["result"]).to eq transactions(:transaction_1).result
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one transactions' json by created_at" do
      get :show, format: :json, created_at: transactions(:transaction_1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["invoice_id"]).to eq transactions(:transaction_1).invoice_id
      expect(body["credit_card_number"]).to eq transactions(:transaction_1).credit_card_number
      expect(body["result"]).to eq transactions(:transaction_1).result
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one transactions' json by updated_at" do
      get :show, format: :json, updated_at: transactions(:transaction_1).created_at

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

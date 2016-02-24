require 'rails_helper'

RSpec.describe Api::V1::FindCustomersController, type: :controller do
  fixtures :customers
  describe "#index" do
    it "finds and serves all customers' json by ID" do
      get :index, format: :json, id: customers(:customer_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_customer = body.first

      expect(first_customer["first_name"]).to eq customers(:customer_1).first_name
      expect(first_customer["last_name"]).to eq customers(:customer_1).last_name
      expect(first_customer["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["first_name"]).to_not eq customers(:customer_2).first_name
      expect(first_customer["last_name"]).to_not eq customers(:customer_2).last_name
      expect(first_customer["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_customer["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all customers' json by first_name" do
      get :index, format: :json, first_name: customers(:customer_1).first_name

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_customer = body.first

      expect(first_customer["first_name"]).to eq customers(:customer_1).first_name
      expect(first_customer["last_name"]).to eq customers(:customer_1).last_name
      expect(first_customer["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["first_name"]).to_not eq customers(:customer_2).first_name
      expect(first_customer["last_name"]).to_not eq customers(:customer_2).last_name
      expect(first_customer["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_customer["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all customers' json by last_name" do
      get :index, format: :json, last_name: customers(:customer_1).last_name

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_customer = body.first

      expect(first_customer["first_name"]).to eq customers(:customer_1).first_name
      expect(first_customer["last_name"]).to eq customers(:customer_1).last_name
      expect(first_customer["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["first_name"]).to_not eq customers(:customer_2).first_name
      expect(first_customer["last_name"]).to_not eq customers(:customer_2).last_name
      expect(first_customer["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_customer["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all customers' json by created_at" do
      get :index, format: :json, created_at: customers(:customer_1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_customer = body.first

      expect(first_customer["first_name"]).to eq customers(:customer_1).first_name
      expect(first_customer["last_name"]).to eq customers(:customer_1).last_name
      expect(first_customer["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["first_name"]).to_not eq customers(:customer_2).first_name
      expect(first_customer["last_name"]).to_not eq customers(:customer_2).last_name
      expect(first_customer["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_customer["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all customers' json by updated_at" do
      get :index, format: :json, updated_at: customers(:customer_1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_customer = body.first

      expect(first_customer["first_name"]).to eq customers(:customer_1).first_name
      expect(first_customer["last_name"]).to eq customers(:customer_1).last_name
      expect(first_customer["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["first_name"]).to_not eq customers(:customer_2).first_name
      expect(first_customer["last_name"]).to_not eq customers(:customer_2).last_name
      expect(first_customer["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_customer["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "finds and serves one customers' json by ID" do
      get :show, format: :json, id: customers(:customer_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["first_name"]).to eq customers(:customer_1).first_name
      expect(body["last_name"]).to eq customers(:customer_1).last_name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one customers' json by first_name" do
      get :show, format: :json, first_name: customers(:customer_1).first_name

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["first_name"]).to eq customers(:customer_1).first_name
      expect(body["last_name"]).to eq customers(:customer_1).last_name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one customers' json by last_name" do
      get :show, format: :json, last_name: customers(:customer_1).last_name

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["first_name"]).to eq customers(:customer_1).first_name
      expect(body["last_name"]).to eq customers(:customer_1).last_name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one customers' json by created_at" do
      get :show, format: :json, created_at: customers(:customer_1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["first_name"]).to eq customers(:customer_1).first_name
      expect(body["last_name"]).to eq customers(:customer_1).last_name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one customers' json by updated_at" do
      get :show, format: :json, updated_at: customers(:customer_1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["first_name"]).to eq customers(:customer_1).first_name
      expect(body["last_name"]).to eq customers(:customer_1).last_name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end

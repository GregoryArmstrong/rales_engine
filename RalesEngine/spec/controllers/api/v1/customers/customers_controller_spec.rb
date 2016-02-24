require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  fixtures :customers
  describe "#index" do
    it "serves all customers' json" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_customer = body.first
      second_customer = body.last

      expect(first_customer["first_name"]).to eq customers(:customer_1).first_name
      expect(first_customer["last_name"]).to eq customers(:customer_1).last_name
      expect(first_customer["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_customer["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(second_customer["first_name"]).to eq customers(:customer_2).first_name
      expect(second_customer["last_name"]).to eq customers(:customer_2).last_name
      expect(second_customer["created_at"]).to eq "2012-03-26T14:54:09.000Z"
      expect(second_customer["updated_at"]).to eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "serves a single customers' json" do
      get :show, format: :json, id: customers(:customer_1).id

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

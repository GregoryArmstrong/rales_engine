require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  describe "#index" do
    it "serves all customers' json" do
      customer_1 = Customer.create(first_name: "first", last_name: "last")
      customer_2 = Customer.create(first_name: "second", last_name: "last")

      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_customer = body.first
      second_customer = body.last

      expect(first_customer["first_name"]).to eq customer_1.first_name
      expect(first_customer["last_name"]).to eq customer_1.last_name
      expect(second_customer["first_name"]).to eq customer_2.first_name
      expect(second_customer["last_name"]).to eq customer_2.last_name
    end

    it "serves a single customers' json" do
      customer_1 = Customer.create(first_name: "first", last_name: "last")

      get :show, format: :json, id: customer_1.id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["first_name"]).to eq customer_1.first_name
      expect(body["last_name"]).to eq customer_1.last_name
    end
  end
end

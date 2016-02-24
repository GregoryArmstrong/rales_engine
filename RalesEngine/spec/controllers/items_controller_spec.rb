require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  fixtures :items
  describe "#index" do
    it "serves all items' json" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first
      second_item = body.last

      expect(first_item["name"]).to eq items(:item_1).name
      expect(first_item["description"]).to eq items(:item_1).description
      expect(first_item["unit_price"]).to eq items(:item_1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item_1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(second_item["name"]).to eq items(:item_2).name
      expect(second_item["description"]).to eq items(:item_2).description
      expect(second_item["unit_price"]).to eq items(:item_2).unit_price
      expect(second_item["merchant_id"]).to eq items(:item_2).merchant_id
      expect(second_item["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(second_item["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "serves a single items' json" do
      get :show, format: :json, id: items(:item_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq items(:item_1).name
      expect(body["description"]).to eq items(:item_1).description
      expect(body["unit_price"]).to eq items(:item_1).unit_price
      expect(body["merchant_id"]).to eq items(:item_1).merchant_id
      expect(body["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
    end
  end
end

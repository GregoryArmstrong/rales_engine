require 'rails_helper'

RSpec.describe Api::V1::FindItemsController, type: :controller do
  fixtures :items
  describe "#index" do
    it "finds and serves all items' json by ID" do
      get :index, format: :json, id: items(:item_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item_1).name
      expect(first_item["description"]).to eq items(:item_1).description
      expect(first_item["unit_price"]).to eq items(:item_1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item_1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item_2).name
      expect(first_item["description"]).to_not eq items(:item_2).description
      expect(first_item["unit_price"]).to_not eq items(:item_2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item_2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all items' json by name" do
      get :index, format: :json, name: items(:item_1).name

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item_1).name
      expect(first_item["description"]).to eq items(:item_1).description
      expect(first_item["unit_price"]).to eq items(:item_1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item_1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item_2).name
      expect(first_item["description"]).to_not eq items(:item_2).description
      expect(first_item["unit_price"]).to_not eq items(:item_2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item_2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all items' json by description" do
      get :index, format: :json, description: items(:item_1).description

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item_1).name
      expect(first_item["description"]).to eq items(:item_1).description
      expect(first_item["unit_price"]).to eq items(:item_1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item_1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item_2).name
      expect(first_item["description"]).to_not eq items(:item_2).description
      expect(first_item["unit_price"]).to_not eq items(:item_2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item_2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all items' json by unit_price" do
      get :index, format: :json, unit_price: items(:item_1).unit_price

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item_1).name
      expect(first_item["description"]).to eq items(:item_1).description
      expect(first_item["unit_price"]).to eq items(:item_1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item_1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item_2).name
      expect(first_item["description"]).to_not eq items(:item_2).description
      expect(first_item["unit_price"]).to_not eq items(:item_2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item_2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all items' json by merchant_id" do
      get :index, format: :json, merchant_id: items(:item_1).merchant_id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_item = body.first

      expect(first_item["name"]).to eq items(:item_1).name
      expect(first_item["description"]).to eq items(:item_1).description
      expect(first_item["unit_price"]).to eq items(:item_1).unit_price
      expect(first_item["merchant_id"]).to eq items(:item_1).merchant_id
      expect(first_item["created_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["updated_at"]).to eq "2012-03-27T14:53:59.000Z"
      expect(first_item["name"]).to_not eq items(:item_2).name
      expect(first_item["description"]).to_not eq items(:item_2).description
      expect(first_item["unit_price"]).to_not eq items(:item_2).unit_price
      expect(first_item["merchant_id"]).to_not eq items(:item_2).merchant_id
      expect(first_item["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_item["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "finds and serves one items' json by ID" do
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

    it "finds and serves one items' json by name" do
      get :show, format: :json, name: items(:item_1).name

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

    it "finds and serves one items' json by description" do
      get :show, format: :json, description: items(:item_1).description

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

    it "finds and serves one items' json by created_at" do
      get :show, format: :json, created_at: items(:item_1).created_at

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

    it "finds and serves one items' json by updated_at" do
      get :show, format: :json, updated_at: items(:item_1).updated_at

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

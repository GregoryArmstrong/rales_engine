require 'rails_helper'

RSpec.describe Api::V1::FindMerchantsController, type: :controller do
  fixtures :merchants
  describe "#index" do
    it "finds and serves all merchants' json by ID" do
      get :index, format: :json, id: merchants(:merchant_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_merchant = body.first

      expect(first_merchant["name"]).to eq merchants(:merchant_1).name
      expect(first_merchant["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_merchant["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_merchant["name"]).to_not eq merchants(:merchant_2).name
      expect(first_merchant["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_merchant["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all merchants' json by name" do
      get :index, format: :json, name: merchants(:merchant_1).name

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_merchant = body.first

      expect(first_merchant["name"]).to eq merchants(:merchant_1).name
      expect(first_merchant["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_merchant["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_merchant["name"]).to_not eq merchants(:merchant_2).name
      expect(first_merchant["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_merchant["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all merchants' json by created_at" do
      get :index, format: :json, created_at: merchants(:merchant_1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_merchant = body.first

      expect(first_merchant["name"]).to eq merchants(:merchant_1).name
      expect(first_merchant["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_merchant["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_merchant["name"]).to_not eq merchants(:merchant_2).name
      expect(first_merchant["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_merchant["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end

    it "finds and serves all merchants' json by updated_at" do
      get :index, format: :json, updated_at: merchants(:merchant_1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_merchant = body.first

      expect(first_merchant["name"]).to eq merchants(:merchant_1).name
      expect(first_merchant["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_merchant["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_merchant["name"]).to_not eq merchants(:merchant_2).name
      expect(first_merchant["created_at"]).to_not eq "2012-03-26T14:54:09.000Z"
      expect(first_merchant["updated_at"]).to_not eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "finds and serves one merchants' json by ID" do
      get :show, format: :json, id: merchants(:merchant_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq merchants(:merchant_1).name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one merchants' json by name" do
      get :show, format: :json, name: merchants(:merchant_1).name

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq merchants(:merchant_1).name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one merchants' json by created_at" do
      get :show, format: :json, created_at: merchants(:merchant_1).created_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq merchants(:merchant_1).name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
    end

    it "finds and serves one merchants' json by updated_at" do
      get :show, format: :json, updated_at: merchants(:merchant_1).updated_at

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq merchants(:merchant_1).name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end

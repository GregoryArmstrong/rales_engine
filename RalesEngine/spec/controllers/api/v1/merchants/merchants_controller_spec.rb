require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  fixtures :merchants
  describe "#index" do
    it "serves all merchants' json" do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)
      first_merchant = body.first
      second_merchant = body.last

      expect(first_merchant["name"]).to eq merchants(:merchant_1).name
      expect(first_merchant["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(first_merchant["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(second_merchant["name"]).to eq merchants(:merchant_2).name
      expect(second_merchant["created_at"]).to eq "2012-03-26T14:54:09.000Z"
      expect(second_merchant["updated_at"]).to eq "2012-03-26T14:54:09.000Z"
    end
  end

  describe "#show" do
    it "serves one merchants' json" do
      get :show, format: :json, id: merchants(:merchant_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq merchants(:merchant_1).name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end

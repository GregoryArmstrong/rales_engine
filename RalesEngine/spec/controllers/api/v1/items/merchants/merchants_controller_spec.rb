require 'rails_helper'

RSpec.describe Api::V1::Items::MerchantsController, type: :controller do
  fixtures :merchants, :items
  describe "#index" do
    it "serves an items' merchant' json" do
      get :index, format: :json, item_id: items(:item_1).id

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body["name"]).to eq merchants(:merchant_1).name
      expect(body["created_at"]).to eq "2012-03-27T14:54:09.000Z"
      expect(body["updated_at"]).to eq "2012-03-27T14:54:09.000Z"
    end
  end
end

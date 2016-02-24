require 'rails_helper'

RSpec.describe Api::V1::RandomInvoiceItemsController, type: :controller do
  fixtures :invoice_items
  describe "#show" do
    it "finds and serves one random invoice_items' json" do
      get :show, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body).to_not eq nil
    end
  end
end

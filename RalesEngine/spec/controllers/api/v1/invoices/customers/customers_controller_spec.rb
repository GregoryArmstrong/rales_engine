require 'rails_helper'

RSpec.describe Api::V1::Invoices::CustomersController, type: :controller do
  fixtures :invoices, :customers
  describe "#index" do
    it "serves all an invoices' customers' json" do
      get :index, format: :json, invoice_id: invoices(:invoice_1).id

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

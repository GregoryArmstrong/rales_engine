require 'rails_helper'

RSpec.describe Api::V1::RandomInvoicesController, type: :controller do
  fixtures :invoices
  describe "#show" do
    it "finds and serves one random invoices' json" do
      get :show, format: :json

      expect(response.status).to eq(200)
      expect(response.content_type).to eq "application/json"

      body = JSON.parse(response.body)

      expect(body).to_not eq nil
    end
  end
end

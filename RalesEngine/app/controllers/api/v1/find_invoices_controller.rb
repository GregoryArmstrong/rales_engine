class Api::V1::FindInvoicesController < Api::ApiController

  respond_to :json

  def index
    case params.first.first
    when "customer_id"
      respond_with Invoice.find_all_by_customer_id(params)
    when "merchant_id"
      respond_with Invoice.find_all_by_merchant_id(params)
    when "status"
      respond_with Invoice.find_all_by_status(params)
    when "created_at"
      respond_with Invoice.find_all_by_created_at(params)
    when "updated_at"
      respond_with Invoice.find_all_by_updated_at(params)
    when "id"
      respond_with Invoice.find_all_by_id(params)
    end
  end

  def show
    case params.first.first
    when "customer_id"
      respond_with Invoice.find_by_customer_id(params)
    when "merchant_id"
      respond_with Invoice.find_by_merchant_id(params)
    when "status"
      respond_with Invoice.find_by_status(params)
    when "created_at"
      respond_with Invoice.find_by_created_at(params)
    when "updated_at"
      respond_with Invoice.find_by_updated_at(params)
    when "id"
      respond_with Invoice.find_by_id(params)
    end
  end
end

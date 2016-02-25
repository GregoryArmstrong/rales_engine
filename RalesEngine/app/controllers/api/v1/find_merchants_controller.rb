class Api::V1::FindMerchantsController < Api::ApiController

  respond_to :json

  def index
    case params.first.first
    when "name"
      respond_with Merchant.find_all_by_name(params)
    when "created_at"
      respond_with Merchant.find_all_by_created_at(params)
    when "updated_at"
      respond_with Merchant.find_all_by_updated_at(params)
    when "id"
      respond_with Merchant.find_all_by_id(params)
    end
  end

  def show
    case params.first.first
    when "name"
      respond_with Merchant.find_by_name(params)
    when "created_at"
      respond_with Merchant.find_by_created_at(params)
    when "updated_at"
      respond_with Merchant.find_by_updated_at(params)
    when "id"
      respond_with Merchant.find_by_id(params)
    end
  end

end

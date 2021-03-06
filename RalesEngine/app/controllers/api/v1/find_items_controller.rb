class Api::V1::FindItemsController < Api::ApiController

  respond_to :json

  def index
    case params.first.first
    when "name"
      respond_with Item.find_all_by_name(params)
    when "description"
      respond_with Item.find_all_by_description(params)
    when "unit_price"
      respond_with Item.find_all_by_unit_price(params)
    when "merchant_id"
      respond_with Item.find_all_by_merchant_id(params)
    when "created_at"
      respond_with Item.find_all_by_created_at(params)
    when "updated_at"
      respond_with Item.find_all_by_updated_at(params)
    when "id"
      respond_with Item.find_all_by_id(params)
    end
  end

  def show
    case params.first.first
    when "name"
      respond_with Item.find_by_name(params)
    when "description"
      respond_with Item.find_by_description(params)
    when "unit_price"
      respond_with Item.find_by_unit_price(params)
    when "merchant_id"
      respond_with Item.find_by_merchant_id(params)
    when "created_at"
      respond_with Item.find_by_created_at(params)
    when "updated_at"
      respond_with Item.find_by_updated_at(params)
    when "id"
      respond_with Item.find_by_id(params)
    end
  end

end

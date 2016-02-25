class Api::V1::FindCustomersController < Api::ApiController

  respond_to :json

  def index
    case params.first.first
    when "first_name"
      respond_with Customer.find_all_by_first_name(params)
    when "last_name"
      respond_with Customer.find_all_by_last_name(params)
    when "created_at"
      respond_with Customer.find_all_by_created_at(params)
    when "updated_at"
      respond_with Customer.find_all_by_updated_at(params)
    when "id"
      respond_with Customer.find_all_by_id(params)
    end
  end

  def show
    case params.first.first
    when "last_name"
      respond_with Customer.find_by_last_name(params)
    when "first_name"
      respond_with Customer.find_by_first_name(params)
    when "created_at"
      respond_with Customer.find_by_created_at(params)
    when "updated_at"
      respond_with Customer.find_by_updated_at(params)
    when "id"
      respond_with Customer.find(params[:id])
    end
  end
end

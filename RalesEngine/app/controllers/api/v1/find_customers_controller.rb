class Api::V1::FindCustomersController < Api::ApiController

  respond_to :json

  def index
    respond_with Customer.find_all_by_first_name(params) if params[:first_name]
    respond_with Customer.find_all_by_last_name(params) if params[:last_name]
    respond_with Customer.find_all_by_created_at(params) if params[:created_at]
    respond_with Customer.find_all_by_updated_at(params) if params[:updated_at]
    respond_with Customer.find_all_by_id(params) if params[:id]
  end

  def show
    if params[:last_name]
      respond_with Customer.find_by_last_name(params)
    elsif params[:first_name]
      respond_with Customer.find_by_first_name(params)
    elsif params[:created_at]
      respond_with Customer.find_by_created_at(params)
    elsif params[:updated_at]
      respond_with Customer.find_by_updated_at(params)
    else
      respond_with Customer.find(params[:id])
    end
  end

end

class Api::V1::CustomersfindController < Api::ApiController

  respond_to :json

  def index
    respond_with Customer.where(first_name: params[:first_name].downcase) if params[:first_name]
    respond_with Customer.where(last_name: params[:last_name].downcase) if params[:last_name]
    respond_with Customer.where(id: params[:id]) if params[:id]

  end

  def show
    respond_with Customer.find_by(first_name: params[:first_name].downcase) if params[:first_name]
    respond_with Customer.find_by(last_name: params[:last_name].downcase) if params[:last_name]
    respond_with Customer.find(params[:id]) if params[:id]
  end

end

class Api::V1::FindCustomersController < Api::ApiController

  respond_to :json

  def index
    respond_with Customer.where('LOWER(first_name) = ?', params[:first_name].downcase) if params[:first_name]
    respond_with Customer.where('LOWER(last_name) = ?', params[:last_name].downcase) if params[:last_name]
    respond_with Customer.where(created_at: params[:created_at]) if params[:created_at]
    respond_with Customer.where(updated_at: params[:updated_at]) if params[:updated_at]
    respond_with Customer.where(id: params[:id]) if params[:id]
  end

  def show
    respond_with Customer.find_by('LOWER(first_name) = ?', params[:first_name].downcase) if params[:first_name]
    respond_with Customer.find_by('LOWER(last_name) = ?', params[:last_name].downcase) if params[:last_name]
    respond_with Customer.find_by(created_at: params[:created_at]) if params[:created_at]
    respond_with Customer.find_by(updated_at: params[:updated_at]) if params[:updated_at]
    respond_with Customer.find(params[:id]) if params[:id]
  end

end

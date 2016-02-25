class Api::V1::FindTransactionsController < Api::ApiController

  respond_to :json

  def index
    case params.first.first
    when "id"
      respond_with Transaction.find_all_by_id(params)
    when "invoice_id"
      respond_with Transaction.find_all_by_invoice_id(params)
    when "credit_card_number"
      respond_with Transaction.find_all_by_credit_card_number(params)
    when "created_at"
      respond_with Transaction.find_all_by_created_at(params)
    when "updated_at"
      respond_with Transaction.find_all_by_updated_at(params)
    when "result"
      respond_with Transaction.find_all_by_result(params)
    end
  end

  def show
    case params.first.first
    when "id"
      respond_with Transaction.find_by_id(params)
    when "invoice_id"
      respond_with Transaction.find_by_invoice_id(params)
    when "credit_card_number"
      respond_with Transaction.find_by_credit_card_number(params)
    when "created_at"
      respond_with Transaction.find_by_created_at(params)
    when "updated_at"
      respond_with Transaction.find_by_updated_at(params)
    when "result"
      respond_with Transaction.find_by_result(params)
    end
  end
end

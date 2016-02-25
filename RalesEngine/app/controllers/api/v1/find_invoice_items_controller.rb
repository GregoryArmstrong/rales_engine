class Api::V1::FindInvoiceItemsController < Api::ApiController

  respond_to :json

  def index
    case params.first.first
    when "item_id"
      respond_with InvoiceItem.find_all_by_item_id(params)
    when "invoice_id"
      respond_with InvoiceItem.find_all_by_invoice_id(params)
    when "quantity"
      respond_with InvoiceItem.find_all_by_quantity(params)
    when "unit_price"
      respond_with InvoiceItem.find_all_by_unit_price(params)
    when "created_at"
      respond_with InvoiceItem.find_all_by_created_at(params)
    when "updated_at"
      respond_with InvoiceItem.find_all_by_updated_at(params)
    when "id"
      respond_with InvoiceItem.find_all_by_id(params)
    end
  end

  def show
    case params.first.first
    when "item_id"
      respond_with InvoiceItem.find_by_item_id(params)
    when "invoice_id"
      respond_with InvoiceItem.find_by_invoice_id(params)
    when "quantity"
      respond_with InvoiceItem.find_by_quantity(params)
    when "unit_price"
      respond_with InvoiceItem.find_by_unit_price(params)
    when "created_at"
      respond_with InvoiceItem.find_by_created_at(params)
    when "updated_at"
      respond_with InvoiceItem.find_by_updated_at(params)
    when "id"
      respond_with InvoiceItem.find_by_id(params)
    end
  end

end

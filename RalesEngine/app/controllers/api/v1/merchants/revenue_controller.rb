class Api::V1::Merchants::RevenueController < Api::ApiController

  respond_to :json

  def index
    if params[:date]
      date = DateTime.parse(params[:date])
      invoices = Merchant.find(params[:merchant_id]).invoices.select_date(date)
    else
      invoices = Merchant.find(params[:merchant_id]).invoices.successful
    end
    invoice_items = InvoiceItem.where(invoice_id: invoices.each { |inv| inv })
    revenue = invoice_items.map do |item|
      item.quantity * item.unit_price
    end
    total = { "revenue" => revenue.reduce(:+) }
    respond_with total
  end

end

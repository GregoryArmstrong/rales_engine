class Api::V1::Items::MostRevenueController < Api::ApiController

  respond_to :json

  def index
    invoice_items = InvoiceItem.all
    revenue = {}
    invoice_items.each do |item|
      if revenue[item.item_id]
        revenue[item.item_id] += (item.quantity * item.unit_price)
      else
        revenue[item.item_id] = (item.quantity * item.unit_price)
      end
    end
    top_contenders = revenue.max_by(params[:quantity].to_i) { |k,v| v}
    winners = top_contenders.map do |contender|
      Item.find(contender[0])
    end
    respond_with winners
  end

end

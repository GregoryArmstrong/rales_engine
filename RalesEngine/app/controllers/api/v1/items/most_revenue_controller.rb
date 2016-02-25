class Api::V1::Items::MostRevenueController < Api::ApiController

  respond_to :json

  def index
    revenue = {}
    InvoiceItem.all.each do |item|
      revenue[item.item_id] += (item.quantity * item.unit_price) if revenue[item.item_id]
      revenue[item.item_id] = (item.quantity * item.unit_price) unless revenue[item.item_id]
    end
    winners = revenue.max_by(params[:quantity].to_i) { |k,v| v}.map do |item|
      Item.find(item[0])
    end
    respond_with winners
  end

end

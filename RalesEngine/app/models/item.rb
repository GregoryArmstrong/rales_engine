class Item < ActiveRecord::Base

  belongs_to :customers
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  before_save :set_unit_price

  def self.find_merchants(params)
    where(merchant_id: params[:merchant_id])
  end

  def self.find_invoice_items(params)
    find(params[:item_id]).invoice_items
  end

  def self.find_merchant(params)
    find(params[:item_id]).merchant
  end

  def self.random
    all.shuffle.first
  end

  private

  def set_unit_price
    self.unit_price = (self.unit_price.to_f / 100).to_s
  end

end

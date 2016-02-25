class InvoiceItem < ActiveRecord::Base

  belongs_to :item
  belongs_to :invoice

  before_save :set_unit_price

  def self.find_invoice_items(params)
    where(invoice_id: params[:invoice_id])
  end
  
  def self.find_invoices(params)
    find(params[:invoice_item_id]).invoice
  end

  def self.find_items(params)
    find(params[:invoice_item_id]).item
  end

  def self.random
    all.shuffle.first
  end

  def self.find_all_by_item_id(params)
    where(item_id: params[:item_id])
  end

  def self.find_all_by_invoice_id(params)
    where(invoice_id: params[:invoice_id])
  end

  def self.find_all_by_quantity(params)
    where(quantity: params[:quantity])
  end

  def self.find_all_by_unit_price(params)
    where(unit_price: params[:unit_price])
  end

  def self.find_all_by_created_at(params)
    where(created_at: params[:created_at])
  end

  def self.find_all_by_updated_at(params)
    where(updated_at: params[:updated_at])
  end

  def self.find_all_by_id(params)
    where(id: params[:id])
  end

  def self.find_by_item_id(params)
    find_by(item_id: params[:item_id])
  end

  def self.find_by_invoice_id(params)
    find_by(invoice_id: params[:invoice_id])
  end

  def self.find_by_quantity(params)
    find_by(quantity: params[:quantity])
  end

  def self.find_by_unit_price(params)
    find_by(unit_price: params[:unit_price])
  end

  def self.find_by_created_at(params)
    find_by(created_at: params[:created_at])
  end

  def self.find_by_updated_at(params)
    find_by(updated_at: params[:updated_at])
  end

  def self.find_by_id(params)
    find_by(id: params[:id])
  end

  private

  def set_unit_price
    self.unit_price = (self.unit_price.to_f / 100).to_s
  end

end

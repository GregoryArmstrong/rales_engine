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

  def self.find_all_by_name(params)
    where('LOWER(name) = ?', params[:name].downcase)
  end

  def self.find_all_by_description(params)
    where('LOWER(description) = ?', params[:description].downcase)
  end

  def self.find_all_by_unit_price(params)
    where(unit_price: params[:unit_price])
  end

  def self.find_all_by_merchant_id(params)
    where(merchant_id: params[:merchant_id])
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

  def self.find_by_name(params)
    find_by('LOWER(name) = ?', params[:name].downcase)
  end

  def self.find_by_description(params)
    find_by('LOWER(description) = ?', params[:description].downcase)
  end

  def self.find_by_unit_price(params)
    find_by(unit_price: params[:unit_price])
  end

  def self.find_by_merchant_id(params)
    find_by(merchant_id: params[:merchant_id])
  end

  def self.find_by_created_at(params)
    find_by(created_at: params[:created_at])
  end

  def self.find_by_updated_at(params)
    find_by(updated_at: params[:updated_at])
  end

  def self.find_by_id(params)
    find(params[:id])
  end

  private

  def set_unit_price
    self.unit_price = (self.unit_price.to_f / 100).to_s
  end

end

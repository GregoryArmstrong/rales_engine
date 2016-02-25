class Merchant < ActiveRecord::Base

  has_many :items
  has_many :invoices

  def self.random
    all.shuffle.first
  end

  def self.find_customers_with_pending_invoices(params)
    find(params[:merchant_id]).invoices.failed.uniq
  end

  def self.find_invoices(params)
    find(params[:merchant_id]).invoices.successful.select("customer_id").group("customer_id").count
  end

end

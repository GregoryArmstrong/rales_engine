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

  def self.find_all_by_name(params)
    where('LOWER(name) = ?', params[:name].downcase)
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

  def self.find_by_created_at(params)
    find_by(created_at: params[:created_at])
  end

  def self.find_by_updated_at(params)
    find_by(updated_at: params[:updated_at])
  end

  def self.find_by_id(params)
    find(params[:id]) if params[:id]
  end

end

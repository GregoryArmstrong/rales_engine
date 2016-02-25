class Customer < ActiveRecord::Base

  has_many :invoices
  has_many :items, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.find_all_by_first_name(params)
    where('LOWER(first_name) = ?', params[:first_name].downcase)
  end

  def self.find_all_by_last_name(params)
    where('LOWER(last_name) = ?', params[:last_name].downcase)
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

  def self.find_by_last_name(params)
    find_by('LOWER(last_name) = ?', params[:last_name].downcase)
  end

  def self.find_by_first_name(params)
    find_by('LOWER(first_name) = ?', params[:first_name].downcase)
  end

  def self.find_by_created_at(params)
    find_by(created_at: params[:created_at])
  end

  def self.find_by_updated_at(params)
    find_by(updated_at: params[:updated_at])
  end
end

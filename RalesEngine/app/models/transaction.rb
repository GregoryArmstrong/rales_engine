class Transaction < ActiveRecord::Base

  belongs_to :invoice

  def self.random
    all.shuffle.first
  end

  def self.find_invoices(params)
    find(params[:transaction_id]).invoice
  end

  def self.find_transactions(params)
    where(invoice_id: params[:invoice_id])
  end

  def self.find_all_by_id(params)
    where(id: params[:id])
  end

  def self.find_all_by_invoice_id(params)
    where(invoice_id: params[:invoice_id])
  end

  def self.find_all_by_credit_card_number(params)
    where(credit_card_number: params[:credit_card_number])
  end

  def self.find_all_by_created_at(params)
    where(created_at: params[:created_at])
  end

  def self.find_all_by_updated_at(params)
    where(updated_at: params[:updated_at])
  end

  def self.find_all_by_result(params)
    where('LOWER(result) = ?', params[:result])
  end

  def self.find_by_id(params)
    find(params[:id])
  end

  def self.find_by_invoice_id(params)
    find_by(invoice_id: params[:invoice_id])
  end

  def self.find_by_credit_card_number(params)
    find_by(credit_card_number: params[:credit_card_number])
  end

  def self.find_by_created_at(params)
    find_by(created_at: params[:created_at])
  end

  def self.find_by_updated_at(params)
    find_by(updated_at: params[:updated_at])
  end

  def self.find_by_result(params)
    find_by('LOWER(result) = ?', params[:result].downcase)
  end

end

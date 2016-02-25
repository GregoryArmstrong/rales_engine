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

end

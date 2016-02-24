class Customer < ActiveRecord::Base

  has_many :invoices
  has_many :items, through: :invoice_items
  has_many :transactions, through: :invoices

end

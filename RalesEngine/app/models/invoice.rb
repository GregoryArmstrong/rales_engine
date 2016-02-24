class Invoice < ActiveRecord::Base

  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  scope :successful, -> { joins(:transactions).where("result = 'success'") }

  scope :select_date, ->(date) { where("extract(month from created_at) = ? and extract(day from created_at) = ?", date.month, date.day) }
end

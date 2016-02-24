class Item < ActiveRecord::Base

  belongs_to :customers
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  before_save :set_unit_price

  private

  def set_unit_price
    self.unit_price = (self.unit_price.to_f / 100).to_s
  end

end

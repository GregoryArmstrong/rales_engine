class InvoiceItem < ActiveRecord::Base

  belongs_to :item
  belongs_to :invoice

  before_save :set_unit_price

  private

  def set_unit_price
    self.unit_price = (self.unit_price.to_f / 100).to_s
  end
  
end

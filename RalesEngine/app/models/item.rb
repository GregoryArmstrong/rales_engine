class Item < ActiveRecord::Base

  belongs_to :customers
  belongs_to :merchant
  belongs_to :invoices


end

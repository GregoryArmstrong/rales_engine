require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  it "correctly converts given date to datetime" do
    ii = InvoiceItem.create(item_id: 1,
                            invoice_id: 29,
                            quantity: 2,
                            unit_price: 75107,
                            created_at: "2012-03-27 14:54:11",
                            updated_at: "2012-03-27 14:54:11"
                            )

    assert ii
    assert_equal "created_at: Tue, 27 Mar 2012 14:54:11 UTC +00:00".to_datetime, ii.created_at
  end
end

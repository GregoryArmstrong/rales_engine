class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :invoice_id
      t.integer :credit_card_number, limit: 8
      t.string :result
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end

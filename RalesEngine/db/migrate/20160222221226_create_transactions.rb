class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :invoice_id
      t.decimal :credit_card_number
      t.integer :credit_card_expiration_data
      t.string :result
      t.string :created_at
      t.string :updated_at
    end
  end
end

class CreateCreditCardCharges < ActiveRecord::Migration
  def change
    create_table :credit_card_charges do |t|
      t.timestamp :created
      t.boolean :paid
      t.decimal :amount
      t.string :currency
      t.boolean :refunded
      t.integer :customer_id
      t.boolean :disputed

      t.timestamps
    end
  end
end

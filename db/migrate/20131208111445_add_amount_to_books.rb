class AddAmountToBooks < ActiveRecord::Migration
  def change
    add_column :books, :amount, :integer, null: false, default: 0
  end
end

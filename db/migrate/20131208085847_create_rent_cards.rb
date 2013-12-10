class CreateRentCards < ActiveRecord::Migration
  def change
    create_table :rent_cards do |t|
      t.references :user, index: true
      t.references :book, index: true
      t.integer :amount

      t.timestamps
    end
  end
end

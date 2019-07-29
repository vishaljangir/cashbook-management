class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.integer :cashbook_index_id
      t.string :particular_name
      t.string :reference
      t.integer :amount

      t.timestamps
    end
  end
end

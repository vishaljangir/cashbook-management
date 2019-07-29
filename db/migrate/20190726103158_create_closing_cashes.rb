class CreateClosingCashes < ActiveRecord::Migration[5.2]
  def change
    create_table :closing_cashes do |t|
      t.integer :cashbook_index_id
      t.integer :denomination
      t.integer :quantity
      t.integer :total

      t.timestamps
    end
  end
end

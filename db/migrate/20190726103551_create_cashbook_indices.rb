class CreateCashbookIndices < ActiveRecord::Migration[5.2]
  def change
    create_table :cashbook_indices do |t|
      t.integer :cr_total
      t.integer :dr_total
      t.integer :cash_in_hand
      t.integer :closing_total

      t.timestamps
    end
  end
end

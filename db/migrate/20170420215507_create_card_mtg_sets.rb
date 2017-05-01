class CreateCardMtgSets < ActiveRecord::Migration[5.0]
  def change
    create_table :card_mtg_sets do |t|
      t.integer :card_id
      t.integer :mtg_set_id

      t.timestamps
    end
  end
end

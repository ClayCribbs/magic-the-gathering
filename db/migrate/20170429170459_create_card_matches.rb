class CreateCardMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :card_matches do |t|
      t.integer :card_ids
      t.integer :match_ids

      t.timestamps
    end
  end
end

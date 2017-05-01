class ChangeCardIdsToCardId < ActiveRecord::Migration[5.0]
  def change
    remove_column :card_matches, :card_ids, :integer
    remove_column :card_matches, :card_ids, :integer
    add_column :card_matches, :card_id, :integer
    add_column :card_matches, :match_id, :integer
  end
end

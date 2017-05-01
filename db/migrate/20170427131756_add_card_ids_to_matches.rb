class AddCardIdsToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :card_ids, :integer
  end
end

class RemoveCardIdsFromMatch < ActiveRecord::Migration[5.0]
  def change
    remove_column :matches, :card_ids, :integer
  end
end

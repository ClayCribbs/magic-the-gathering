class CreateMtgSets < ActiveRecord::Migration[5.0]
  def change
    create_table :mtg_sets do |t|
      t.string :code
      t.string :name
      t.string :gatherer_code
      t.string :old_code
      t.string :magic_cards_info_code
      t.string :release_date
      t.string :border
      t.string :set_type
      t.string :block
      t.string :online_only
      t.string :booster
      t.string :mkm_id
      t.string :mkm_name

      t.timestamps
    end
  end
end

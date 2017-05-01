class MtgSet < ApplicationRecord
  has_many :card_mtg_sets
  has_many :cards, through: :card_mtg_sets, source: :card
end

class CardMtgSet < ApplicationRecord
  belongs_to :card
  belongs_to :mtg_set
end

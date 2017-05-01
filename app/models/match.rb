class Match < ApplicationRecord
  include CompareCardsHelper

  has_many :card_match
  has_many :cards, through: :card_match, source: :card


  def card_status
    messages = []
    toughness = faceoff_cards_return_toughness(self.cards.first, self.cards.last)
    if toughness[0] <= 0
      messages << "#{self.cards.first.name} is sent to the graveyard"
    else
      messages << "#{self.cards.first.name} survives with #{toughness[0]} toughness"
    end
    if toughness[1] <= 0
      messages << "#{self.cards.last.name} is sent to the graveyard"
    else
      messages << "#{self.cards.last.name} survives with #{toughness[1]} toughness"
    end
    messages
  end
end

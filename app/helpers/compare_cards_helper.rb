module CompareCardsHelper
  def faceoff_cards_return_toughness(card_1, card_2)
    results = []
    results << card_1.toughness.to_i - card_2.power.to_i
    results << card_2.toughness.to_i - card_1.power.to_i
    results
  end
end
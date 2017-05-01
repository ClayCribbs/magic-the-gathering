class FetchImagesJob < ApplicationJob
  queue_as :urgent

  def perform(*cards)
    @cards = Card.where(id: cards)
    puts @cards
    @cards.each do |card|
      card.get_image
    end
  end
end

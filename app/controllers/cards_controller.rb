class CardsController < ApplicationController
  include CompareCardsHelper

  def index
    if params[:selected_mtg_set].present?
      @selected_mtg_set = MtgSet.find(params[:selected_mtg_set])
      @cards = @selected_mtg_set.cards

      #Fetch Images for cards without an image
      @no_image_cards = @cards.where(image_url: nil)
      Delayed::Job.enqueue FetchImagesJob.new(@no_image_cards.pluck(:id)) unless @no_image_cards.count == 0 || Delayed::Job.all.any?
    else
      @cards = Card.all
    end
  end

  def show
    @card = Card.find(params[:id])
    @card.get_image unless @card.image_url.present?
  end

  private
  def create_cards
    @mtg_cards = MTG::Card.all
    @mtg_cards.each do |mtg_card|
      this_card = Card.new()
      this_card.name = mtg_card.name if mtg_card.name.present?
      this_card.multiverse_id = mtg_card.multiverse_id if mtg_card.multiverse_id.present?
      this_card.layout = mtg_card.layout if mtg_card.layout.present?
      this_card.names = mtg_card.names if mtg_card.names.present?
      this_card.mana_cost = mtg_card.mana_cost if mtg_card.mana_cost.present?
      this_card.cmc = mtg_card.cmc if mtg_card.cmc.present?
      this_card.colors = mtg_card.colors if mtg_card.colors.present?
      this_card.special_type = mtg_card.type if mtg_card.type.present?
      this_card.supertypes = mtg_card.supertypes if mtg_card.supertypes.present?
      this_card.subtypes = mtg_card.subtypes if mtg_card.subtypes.present?
      this_card.rarity = mtg_card.rarity if mtg_card.rarity.present?
      this_card.text = mtg_card.text if mtg_card.text.present?
      this_card.flavor = mtg_card.flavor if mtg_card.flavor.present?
      this_card.artist = mtg_card.artist if mtg_card.artist.present?
      this_card.number = mtg_card.number if mtg_card.number.present?
      this_card.power = mtg_card.power if mtg_card.power.present?
      this_card.toughness = mtg_card.toughness if mtg_card.toughness.present?
      this_card.loyalty = mtg_card.loyalty if mtg_card.loyalty.present?
      this_card.variations = mtg_card.variations if mtg_card.variations.present?
      this_card.watermark = mtg_card.watermark if mtg_card.watermark.present?
      this_card.border = mtg_card.border if mtg_card.border.present?
      this_card.timeshifted = mtg_card.timeshifted if mtg_card.timeshifted.present?
      this_card.hand = mtg_card.hand if mtg_card.hand.present?
      this_card.life = mtg_card.life if mtg_card.life.present?
      this_card.reserved = mtg_card.reserved if mtg_card.reserved.present?
      this_card.release_date = mtg_card.release_date if mtg_card.release_date.present?
      this_card.starter = mtg_card.starter if mtg_card.starter.present?
      this_card.rulings = mtg_card.rulings if mtg_card.rulings.present?
      this_card.foreign_names = mtg_card.foreign_names if mtg_card.foreign_names.present?
      this_card.printings = mtg_card.printings if mtg_card.printings.present?
      this_card.original_text = mtg_card.original_text if mtg_card.original_text.present?
      this_card.original_type = mtg_card.original_type if mtg_card.original_type.present?
      this_card.legalities = mtg_card.legalities if mtg_card.legalities.present?
      this_card.source = mtg_card.source if mtg_card.source.present?
      this_card.image_url = mtg_card.image_url if mtg_card.image_url.present?
      this_card.set = mtg_card.set if mtg_card.set.present?
      this_card.set_name = mtg_card.set_name if mtg_card.set_name.present?
      this_card.save
    end
  end

  private

  def get_images(cards)
    cards.each do |card|
      @image = MTG::Card.find(card.multiverse_id).image_url
      card.remote_image_url_url = @image
      card.save
    end
  end
end

class Card < ApplicationRecord
  has_many :card_mtg_sets
  has_many :mtg_sets, through: :card_mtg_sets, source: :mtg_set

  has_many :card_match
  has_many :matches, through: :card_match, source: :match

  mount_uploader :image_url, ImageUploader


  def get_image
    if self.multiverse_id.present?
      image = MTG::Card.find(self.multiverse_id).image_url
    else
      image = MTG::Card.where(name: self.name).where(set: self.set).all.first.image_url
      unless image.present?
        image = MTG::Card.where(name: self.name).all.first.image_url
      end
    end
    if image
      self.remote_image_url_url = image
      self.save
    else
    end
  end
  handle_asynchronously :get_image
end

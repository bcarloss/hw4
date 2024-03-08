class Entry < ApplicationRecord
  # Associations
  belongs_to :place
  belongs_to :user
  has_one_attached :image

  # Validations
  validates :title, :description, :occurred_on, presence: true
  validates :image, presence: true
  validate :validate_image

  def display_image
    image.variant(resize_to_limit: [500, 500]).processed
  end

  private

  def validate_image
    if image.attached?
      if !image.content_type.in?(%('image/png', 'image/jpg', 'image/jpeg'))
        errors.add(:image, 'must be a PNG, JPG, or JPEG')
      elsif image.blob.byte_size > 5.megabytes
        errors.add(:image, 'is too large, should be less than 5MB')
      end
    end
  end
end



class Entry < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_one_attached :image

  validates :title, :description, :occurred_on, presence: true
  validates :image, presence: true
  validate :validate_image_type

  private

  def validate_image_type
    if image.attached?
      unless image.content_type.in?(%w(image/png image/jpg image/jpeg))
        errors.add(:image, 'must be a PNG, JPG, or JPEG file')
      end
    end
  end
end



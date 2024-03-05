class Entry < ApplicationRecord
  # Associations
  belongs_to :place
  belongs_to :user
  has_one_attached :image

  # Validations
  validates :title, :description, :occurred_on, presence: true
  # Add any other validations you might need for an entry

  # For image validation, you can add file presence, content type, and size validators if desired
  validates :image, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'],
                                    message: 'must be a valid image format' },
                    size: { less_than: 5.megabytes,
                            message: 'should be less than 5MB' }

  # To retrieve a variant of the image, you might have a method like this:
  def display_image
    image.variant(resize_to_limit: [500, 500]).processed
  end
end


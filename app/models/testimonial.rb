class Testimonial < ApplicationRecord
  has_rich_text :message
  has_one_attached :photo
end

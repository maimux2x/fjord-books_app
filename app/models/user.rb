# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png] },
                      size: { less_than: 1.megabytes }
end

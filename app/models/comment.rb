# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :description, presence: true

  def editable?(user)
    user_id == user.id
  end
end

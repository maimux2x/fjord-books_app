# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :description, presence: true

  def editable?(current_user)
    user_id == current_user.id
  end
end

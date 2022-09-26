# frozen_string_literal: true

class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, :description, presence: true

  def editable?(current_user)
    user_id == current_user.id
  end
end

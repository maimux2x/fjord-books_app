# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :follow_relationships, class_name: :Following, inverse_of: :follower, foreign_key: :follower_id, dependent: :destroy
  has_many :followed_relationships, class_name: :Following, inverse_of: :followed, foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :follow_relationships, source: :followed
  has_many :followers, through: :followed_relationships, source: :follower

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    follow_relationships.find_by!(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
end

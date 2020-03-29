# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :headings
  has_many :friendships
  has_many :members, through: :friendships

  def friends_lists
    Friendship.where(friend: self).or(Friendship.where(member: self))
  end
end

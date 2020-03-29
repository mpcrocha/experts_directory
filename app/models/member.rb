# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :headings
  has_many :friendships
  has_many :members, through: :friendships

  def friends_lists
    Friendship.where(friend: self).or(Friendship.where(member: self))
  end

  def friends_links
    friends = friends_lists
    friends.each do |friend|
      if friend.member == self
        friend.friend
      end
    end
  end

end

# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :headings
  has_many :friendships
  has_many :members, through: :friendships

  def friends_lists
    Friendship.where(friend: self).or(Friendship.where(member: self))
  end

  def member_friends
    member_friends = []
    friends = friends_lists
    friends.each do |friend|
      member_friends.append(friend.friend) if friend.friend != self
      member_friends.append(friend.member) if friend.member != self
    end
    member_friends
  end
end

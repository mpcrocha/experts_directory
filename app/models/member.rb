# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :headings
  has_many :members, through: :friendships
end

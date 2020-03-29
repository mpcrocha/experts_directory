# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :headings
end

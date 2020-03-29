# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.timestamps
      t.references :member
      t.references :friend
    end
    add_foreign_key :friendships, :members, column: :member_id, primary_key: :id
    add_foreign_key :friendships, :members, column: :friend_id, primary_key: :id
  end
end

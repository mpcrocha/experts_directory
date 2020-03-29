# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :personal_website
      t.string :shortened_url

      t.timestamps
    end
  end
end

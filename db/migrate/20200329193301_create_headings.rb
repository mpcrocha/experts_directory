# frozen_string_literal: true

class CreateHeadings < ActiveRecord::Migration[6.0]
  def change
    create_table :headings do |t|
      t.belongs_to :member
      t.string :topic

      t.timestamps
    end
  end
end

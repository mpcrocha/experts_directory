class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :personal_website
      t.string :shortned_url

      t.timestamps
    end
  end
end

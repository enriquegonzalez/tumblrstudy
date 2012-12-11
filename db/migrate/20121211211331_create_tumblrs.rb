class CreateTumblrs < ActiveRecord::Migration
  def change
    create_table :tumblrs do |t|
      t.string :title
      t.string :url
      t.integer :followers
      t.integer :total_posts
      t.integer :total_notes

      t.timestamps
    end
  end
end

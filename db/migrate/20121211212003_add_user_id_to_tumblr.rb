class AddUserIdToTumblr < ActiveRecord::Migration
  def change
  	add_column :tumblr, :user_id, :integer
  end
end

class AddUserIdToAuthorization < ActiveRecord::Migration
  def change
  	add_column :authorization, :user_id, :integer
  end
end

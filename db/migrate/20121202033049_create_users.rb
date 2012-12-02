class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :tumblr_token
      t.string :tumblr_secret

      t.timestamps
    end
  end
end

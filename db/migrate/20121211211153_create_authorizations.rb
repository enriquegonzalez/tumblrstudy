class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :token
      t.string :secret
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end

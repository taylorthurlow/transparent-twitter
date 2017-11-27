class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :uid
      t.string :name
      t.string :screen_name
      t.string :profile_image

      t.timestamps null: false
    end
  end
end

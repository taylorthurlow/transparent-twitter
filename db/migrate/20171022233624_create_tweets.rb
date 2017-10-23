class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :tweet_id, limit: 8 # byte size bigger to fit large ids from twitter api
      t.string :tweet_url
      t.string :tweet_text
      t.string :user_name
      t.string :user_handle
      t.string :user_picture_url
      t.integer :classification, default: 0

      t.timestamps null: false
    end
  end
end

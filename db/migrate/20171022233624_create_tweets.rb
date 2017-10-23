class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :url
      t.string :text
      t.integer :classification, default: 0

      t.timestamps null: false
    end
  end
end

class AddUsersToTwitterUsers < ActiveRecord::Migration
  def change
    add_reference :twitter_users, :user, index: true, foreign_key: true
  end
end

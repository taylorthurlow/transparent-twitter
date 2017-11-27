class IndexFriendsService < Struct.new(:user_id)
  def call
    @user = User.find(user_id)
    index_friends
  end

  def index_friends
    # find friends which have been removed, and remove their records
    # current_friend_uids = friends.collect { |f| f['uid'] }
    # @user.twitter_users.each do |f|
    #   f.destroy unless current_friend_uids.include? f.uid
    # end

    @user.twitter.friends.each do |friend|
      twitter_user = TwitterUser.find_or_create_by(uid: friend.id)
      twitter_user.update(
        name: friend.name,
        screen_name: friend.screen_name,
        profile_image: friend.profile_image_url_https.to_s,
        user_id: @user.id
      )
    end
  end
end

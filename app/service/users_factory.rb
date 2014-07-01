class UsersFactory
  def self.create_users(auth)
    if auth[:provider]  == 'facebook'
      @user = Users::Facebook.new(auth)
    elsif auth[:provider] == 'twitter'
      @user = Users::Twitter.new(auth)
    elsif auth[:provider] == 'developer'
      @user = Users::Developer.new(auth)
    end
    @user
  end
end

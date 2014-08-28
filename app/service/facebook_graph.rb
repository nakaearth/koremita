class FacebookGraph
  # current_userのomniauth['credentials']['token']をセット
  def initialize(access_token)
    @graph = Koala::Facebook::API.new(access_token)
  end

  def me
    @graph.get_object('me')
  end

  def current_user_friends
    @graph.get_connections('me', 'friends')
  end
end

class FollowingsPostsController < ApplicationController
  before_action :set_followers

  # GET /users/:user_id/followings/posts
  def index
    json_response(@posts)
  end

  # GET /users/:user_id/posts/:id
  def show
    json_response(@posts)
  end

  private

  def set_followers

    @followings = Relationship.where(follower_id: params[:user_id])
    @posts = []
    p(@followings)
    @followings.each do |p|
      puts(p['followed_id'])
      @posts << Post.where(user_id: p['followed_id']) if p['followed_id']
    end
  end

end


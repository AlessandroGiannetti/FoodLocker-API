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

    @posts = Post.joins("INNER JOIN users ON posts.user_id = users.id")
                 .select("posts.*, users.username, users.photo_profile")
                 .where(user_id: Relationship.where(follower_id: params[:user_id]).select("relationships.followed_id"))

  end

end


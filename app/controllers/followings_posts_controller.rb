class FollowingsPostsController < ApplicationController
  before_action :set_followers
  before_action :set_post, only: [:update]

  # GET /users/:user_id/followings/posts
  def index
    json_response(@posts)
  end

  # GET /users/:user_id/posts/:id
  def show
    json_response(@posts)
  end

  def update
    @post.write_attribute(:likes, @post.likes + 1)
    @post.save
    json_response(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_followers
    @followings = Relationship.where(follower_id: params[:user_id]).select("relationships.followed_id")

    @posts = Post.joins("INNER JOIN users ON posts.user_id = users.id")
                 .select("posts.*, users.username, users.photo_profile")
                 .where("posts.user_id = ? OR posts.user_id IN (?)",
                        params[:user_id],
                        @followings)
                 .reverse_order

  end

end


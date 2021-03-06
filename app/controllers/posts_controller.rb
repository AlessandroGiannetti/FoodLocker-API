class PostsController < ApplicationController
  before_action :set_user
  before_action :set_user_post, only: [:update, :index]

  # GET /users/:user_id/posts
  def index
    json_response(@post)
  end

  # GET /users/:user_id/posts/:id
  def show
    json_response(Post.find_by(id: params[:id]))
  end

  # POST /users/:users_id/posts
  def create
    @post = @user.posts.create!(item_params)
    json_response(@post, :created)
  end

  # PUT /users/:user_id/posts/:id
  def update
    Post.find_by(id: params[:id]).write_attribute(:likes, @post.likes + 1)
    @post.save
    json_response(@post)
  end

  # DELETE /users/:user_id/posts/:id
  def destroy
    Post.find_by(id: params[:id]).destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:content, :photo, :likes, :id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_post
    @post = @user.posts.reverse_order if @user
  end
end

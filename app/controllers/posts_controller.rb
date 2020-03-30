class PostsController < ApplicationController
  before_action :set_user
  before_action :set_user_post, only: [:show, :update, :destroy]

  # GET /users/:user_id/posts
  def index
    json_response(@user.posts)
  end

  # GET /users/:user_id/posts/:id
  def show
    json_response(@post)
  end

  # POST /users/:users_id/posts
  def create
    @post = @user.posts.create!(item_params)
    json_response(@post, :created)
  end

  # PUT /users/:user_id/posts/:id
  def update
    @post.update(item_params)
    head :no_content
  end

  # DELETE /users/:user_id/posts/:id
  def destroy
    @post.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:content, :photoProfile)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_post
    @post = @user.posts.find_by!(id: params[:id]) if @user
  end
end

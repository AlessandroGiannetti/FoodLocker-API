class FollowersController < ApplicationController
  before_action :set_user
  before_action :set_relationships, only: [:show, :update, :destroy]

  # GET /users/1/followers
  def index
    @followers = @user.followers.all
    json_response(@followers)
  end

  # POST /users/:user_id/followers
  def create
    @follower = Relationship.create!(relationship_params)
    json_response(@follower, :created)
  end

  # GET /users/:user_id/followers/:follower_id
  def show
    json_response(@follower)
  end

  # PUT /user/:user_id/followers/:follower_id
  def update
    @follower.update(relationship_params)
    head :no_content
  end

  # DELETE /user/:user_id/followers/:follower_id
  def destroy
    @follower.destroy
    head :no_content
  end

  private

  def relationship_params
    # whitelist params
    params.permit(:follower_id, :followed_id).with_defaults(followed_id: @user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_relationships
    @follower = @user.followers.find(params[:id]) if @user
  end
end

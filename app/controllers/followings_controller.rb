class FollowingsController < ApplicationController
  before_action :set_user
  before_action :set_relationships, only: [:show, :update, :destroy]

  # GET /users/:users_id/followings
  def index
    @followings = @user.following.all
    json_response(@followings)
  end

  # POST /users/:user_id/followings/
  def create
    @following = Relationship.create!(relationship_params)
    json_response(@following, :created)
  end

  # GET /users/:user_id/followings/:following_id
  def show
    json_response(@following)
  end

  # PUT /user/:user_id/followings/:following_id
  def update
    @user.update(relationship_params)
    head :no_content
  end

  # DELETE /user/:user_id/followings/:following_id
  def destroy
    Relationship.find_by(follower_id: @user.id, followed_id: params[:id])
    head :no_content
  end

  private

  def relationship_params
    # whitelist params
    params.permit(:follower_id, :followed_id).with_defaults(follower_id: @user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_relationships
    @following = @user.following.find(params[:id]) if @user
  end
end

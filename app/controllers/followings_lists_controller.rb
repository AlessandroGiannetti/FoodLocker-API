class FollowingsListsController < ApplicationController
  before_action :set_followers


  def index
    json_response(@followings)
  end

  private

  def set_followers
    @followings = Relationship.where(follower_id: params[:user_id]).select("relationships.id, relationships.followed_id")
  end

end

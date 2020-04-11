class ResearchesController < ApplicationController
  before_action :set_users

  # GET /users
  def index
    json_response(@user)
  end

  def show
    json_response(@user)
  end

  private

  def set_users
    @user = User.select("relationships.follower_id, users.id, users.username, users.photo_profile")
                .joins("LEFT JOIN relationships ON relationships.followed_id = users.id")
                .where("(relationships.follower_id = ? OR relationships.follower_id ~* ?) AND users.username ~* ?", params[:user_id], '.*', params[:id])
                .uniq


  end
end

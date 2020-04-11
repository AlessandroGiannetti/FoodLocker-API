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

    @user = User.select("users.*")
                .where("users.username ~* ?", params[:id]).uniq

  end
end

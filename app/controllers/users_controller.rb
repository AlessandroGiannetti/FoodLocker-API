class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :index]

  # GET /users
  def index
    headers :no_content
  end

  # POST /user
  def create
    @user = User.create!(user_params)
    @user.diary = Diary.create
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /user/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /user/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    # whitelist params
    params.permit(:id, :username, :photo_profile, :token)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
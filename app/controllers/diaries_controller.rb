class DiariesController < ApplicationController
  before_action :set_user
  before_action :set_user_diary, only: [:show, :update, :destroy]

  # GET /users/:user_id/diaries
  def index
    json_response(@user.diary)
  end

  # GET /users/:user_id/diaries/:id
  def show
    json_response(@diary)
  end

  # POST /users/:users_id/diaries
  def create
    @diary = @user.diary = Diary.create
    json_response(@diary, :created)
  end

  # PUT /users/:user_id/diary/:id
  def update
    @diary.update(item_params)
    head :no_content
  end

  # DELETE /diary/:id
  def destroy
    @diary.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:id, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_diary
    @diary = Diary.find(params[:id]) if @user
  end
end


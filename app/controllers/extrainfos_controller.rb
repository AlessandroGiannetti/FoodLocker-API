class ExtrainfosController < ApplicationController
  before_action :set_user
  before_action :set_user_extrainfo, only: [:show, :update, :destroy]

  # GET /users/:user_id/extrainfos
  def index
    json_response(@user.extrainfo)
  end

  # GET /users/:user_id/extrainfos/:id
  def show
    json_response(@extrainfo)
  end

  # POST /users/:users_id/extrainfos
  def create
    @extrainfo = @user.extrainfo = Extrainfo.create!(item_params)
    json_response(@extrainfo, :created)
  end

  # PUT /users/:user_id/extrainfos/:id
  def update
    @extrainfo.update(item_params)
    head :no_content
  end

  # DELETE /extrainfos/:id
  def destroy
    @extrainfo.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:age, :gender, :height, :weight, :target_weight, :water, :sport_time, :daily_kcal, :user_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_extrainfo
    @extrainfo = @user.extrainfo.find_by!(id: params[:id]) if @user
  end
end
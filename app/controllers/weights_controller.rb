class WeightsController < ApplicationController
  before_action :set_user
  before_action :set_user_weight, only: [:show, :update, :destroy]

  # GET /users/:user_id/weights
  def index
    json_response(@user.weights.order("id DESC"))
  end

  # GET /users/:user_id/weights/:id
  def show
    json_response(@weight)
  end

  # POST /users/:users_id/weights
  def create
    @weight = @user.weights.create!(item_params)
    json_response(@weight, :created)
  end

  # PUT /users/:user_id/weights/:id
  def update
    @weight.update(item_params)
    json_response(@weight)
  end

  # DELETE /users/:user_id/weights/:id
  def destroy
    @weight.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:weight, :photo)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_weight
    @weight = @user.weights.find_by!(id: params[:id]) if @user
  end
end

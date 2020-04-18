class FoodsIdController < ApplicationController
  before_action :set_food, only: [:show]

  # GET /foods
  def index
    :no_content
  end

  # POST /foods
  def create
    :no_content
  end

  # GET /foods/:id
  def show
    json_response(@food)
  end

  # PUT /foods/:id
  def update
    :no_content
  end

  # DELETE /foods/:id
  def destroy
    :no_content
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end
end

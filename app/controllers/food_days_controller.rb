class FoodDaysController < ApplicationController
  before_action :set_day
  before_action :set_day_food, only: [:show, :update, :destroy]

  # GET /days/:day_id/food_days/
  def index
    json_response(@day.food_days)
  end

  # GET /days/:day_id/day_foods/:id
  def show
    json_response(@day_food)
  end

  # POST /diaries/:diary_id/days
  def create
    @day_food = @day.food_days.create!(day_food_params)
    json_response(@day_food, :created)
  end

  # PUT /diaries/:diary_id/days/:id
  def update
    @day_food.update(day_food_params)
    head :no_content
  end

  # DELETE /diaries/:diary_id/days/:id
  def destroy
    @day_food.destroy
    head :no_content
  end

  private

  def day_food_params
    params.permit(:day_id, :food_id, :meal)
  end

  def set_day
    @day = Day.find(params[:day_id])
  end

  def set_day_food

    @day_food = Food.joins("INNER JOIN food_days ON foods.id = food_days.food_id")
                    .select("food_days.id, food_days.meal, foods.*")
                    .where("foods.id = ?", params[:id])


  end

end

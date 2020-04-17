class FoodDaysController < ApplicationController
  before_action :set_day_diary
  before_action :set_day_food

  # GET /days/:day_id/food_days/
  def index
    json_response(@day_food)
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

  def set_day_diary
    @diary = Diary.find_by(user_id: params[:user_id])
    @day = Day.find_by(date: params[:day_id])
  end

  def set_day_food

    @day_food = Food.joins("INNER JOIN food_days ON foods.id = food_days.food_id")
                    .select("food_days.id, food_days.meal, foods.*")
                    .where("food_days.day_id = ?", @day.id)
    
    @day_food = {} if @day_food == NIL


  end

end

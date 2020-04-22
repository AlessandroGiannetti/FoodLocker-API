class FoodDaysController < ApplicationController
  before_action :set_day_diary, only: [:show, :index, :create]
  before_action :set_day_food_join, only: [:show, :index, :create]
  before_action :set_elem_by_id, only: [:update, :destroy]

  # GET /days/:day_id/food_days/
  def index
    json_response(@day_food_join)
  end

  # GET /days/:day_id/day_foods/:id
  def show
    json_response(@day_food_join)
  end

  # POST /diaries/:diary_id/days
  def create
    @day_food_join = @day.food_days.create!(day_food_params)
    json_response(@day_food_join, :created)
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
    params.permit(:day_id, :food_id, :meal, :user_id, :id)
  end

  def set_day_diary
    @diary = Diary.find_by(user_id: params[:user_id])
    @day = Day.find_by(date: params[:day_id], diary_id: @diary.id)
  end

  def set_day_food_join
    @day_food_join = Food.joins("INNER JOIN food_days ON foods.id = food_days.food_id")
                         .select("food_days.id, food_days.meal, foods.*")
                         .where("food_days.day_id = ?", @day.id)
    @day_food_join = {} if @day_food_join == NIL
  end

  def set_elem_by_id
    @day_food = FoodDay.find(params[:id])
  end


end

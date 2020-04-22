class SportDaysController < ApplicationController
  before_action :set_day_diary, only: [:show, :index, :create]
  before_action :set_day_sport, only: [:show, :index, :create]
  before_action :set_elem_by_id, only: [:update, :destroy]

  # GET /days/:day_id/sport_days/
  def index
    json_response(@day_sport_join)
  end

  # GET /days/:day_id/sport_days/:id
  def show
    json_response(@day_sport_join)
  end

  # POST /diaries/:diary_id/days
  def create
    @day_sport_join = @day.sport_days.create!(day_sport_params)
    json_response(@day_sport_join, :created)
  end

  # PUT /diaries/:diary_id/days/:id
  def update
    @day_sport.update(day_sport_params)
    head :no_content
  end

  # DELETE /diaries/:diary_id/days/:id
  # use carefully
  def destroy
    @day_sport.destroy
    head :no_content
  end

  private

  def day_sport_params
    params.permit(:day_id, :sport_id, :hour, :user_id, :id)
  end

  def set_day_diary
    @diary = Diary.find_by(user_id: params[:user_id])
    @day = Day.find_by(date: params[:day_id], diary_id: @diary.id)
  end

  def set_day_sport
    @day_sport_join = Sport.joins("INNER JOIN sport_days ON sports.id = sport_days.sport_id")
                          .select("sport_days.*, sports.*")
                          .where("sport_days.day_id = ?", @day.id)

    @day_sport_join = {} if @day_sport_join == NIL

  end

  def set_elem_by_id
    @day_sport = SportDay.find(params[:id])
  end

end

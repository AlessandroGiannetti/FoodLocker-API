class SportDaysController < ApplicationController
  before_action :set_day_diary
  before_action :set_day_sport

  # GET /days/:day_id/sport_days/
  def index
    json_response(@day_sport)
  end

  # GET /days/:day_id/sport_days/:id
  def show
    json_response(@day_sport)
  end

  # POST /diaries/:diary_id/days
  def create
    @day_sport = @day.sport_days.create!(day_sport_params)
    json_response(@day_sport, :created)
  end

  # PUT /diaries/:diary_id/days/:id
  def update
    @day_sport.update(day_sport_params)
    head :no_content
  end

  # DELETE /diaries/:diary_id/days/:id
  def destroy
    @day_sport.destroy
    head :no_content
  end

  private

  def day_sport_params
    params.permit(:day_id, :sport_id, :hour)
  end

  def set_day_diary
    @diary = Diary.find_by(user_id: params[:user_id])
    @day = Day.find_by(date: params[:day_id])
  end

  def set_day_sport
    @day_sport = Sport.joins("INNER JOIN sport_days ON sports.id = sport_days.sport_id")
                     .select("sport_days.*, sports.*")
                     .where("sport_days.day_id = ?", @day.id)

    @day_sport = {} if @day_sport == NIL

  end

end

class DaysController < ApplicationController
  before_action :set_diary
  before_action :set_diary_day, only: [:show, :update, :destroy]

  # GET /diaries/:diary_id/days
  def index
    json_response(@diary.days)
  end

  # GET /diaries/:diary_id/day/:id
  def show
    json_response(@day)
  end

  # POST /diaries/:diary_id/days
  def create
    @day = @diary.days.create!(day_params)
    json_response(@day, :created)
  end

  # PUT /diaries/:diary_id/days/:id
  def update
    @day.update(day_params)
    head :no_content
  end

  # DELETE /diaries/:diary_id/days/:id
  def destroy
    @day.destroy
    head :no_content
  end

  private

  def day_params
    params.permit(:date, :water, :note)
  end

  def set_diary
    @diary = Diary.find_by(user_id: params[:user_id])
  end

  def set_diary_day
    @day = Day.find_by(date: params[:id], diary_id: @diary.id) if @diary

    @day = {} if @day == NIL
  end
end

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
    @diary = Diary.find(params[:diary_id])
  end

  def set_diary_day
    @days = @diary.days.find_by!(id: params[:id]) if @diary
    @day = Day.find(params[:id]) if @diary
  end
end

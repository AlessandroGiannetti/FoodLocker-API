class SportsController < ApplicationController
  before_action :set_sport, only: [:show, :update, :destroy]

  # GET /sports
  def index
    @sports = Sport.all
    json_response(@sports)
  end

  # POST /sports
  def create
    @sport = Sport.create!(sport_params)
    json_response(@sport, :created)
  end

  # GET /foods/:id
  def show
    json_response(@sport)
  end

  # PUT /foods/:id
  def update
    @sport.update(sport_params)
    head :no_content
  end

  # DELETE /foods/:id
  def destroy
    @sport.destroy
    head :no_content
  end

  private

  def sport_params
    # whitelist params
    params.permit(:name, :calories)
  end

  def set_sport
    @sport = Sport.select("sports.*")
                 .where("sports.name ~* ?", params[:id]).uniq
  end
end

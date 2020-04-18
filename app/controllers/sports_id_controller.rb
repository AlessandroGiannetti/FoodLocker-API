class SportsIdController < ApplicationController
  before_action :set_sport, only: [:show]

  # GET /sports
  def index
    :no_content
  end

  # POST /sports
  def create
    :no_content
  end

  # GET /sports/ :id
  def show
    json_response(@sport)
  end

  # PUT /sports/ :id
  def update
    :no_content
  end

  # DELETE /sports/ :id
  def destroy
    :no_content
  end

  private

  def set_sport
    @sport = Sport.find(params[:id])
  end
end

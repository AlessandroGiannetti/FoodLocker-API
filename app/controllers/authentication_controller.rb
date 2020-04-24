class AuthenticationController < ApplicationController

  # GET /diaries/:diary_id/days
  def index
    head :no_content
  end

  # GET /diaries/:diary_id/day/:id
  def show
    @response = FirebaseIdToken::Signature.verify(token)
    json_response(@response)
  end

  # POST /diaries/:diary_id/days
  def create
    head :no_content
  end

  # PUT /diaries/:diary_id/days/:id
  def update
    head :no_content
  end

  # DELETE /diaries/:diary_id/days/:id
  def destroy
    head :no_content
  end

  private
  def auth_params
    params.permit(:id, :token)
  end
end

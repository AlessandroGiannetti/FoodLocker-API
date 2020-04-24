class ApplicationController < ActionController::API
  attr_reader :current_user

  include Response
  include ExceptionHandler

end
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper #temprorary session cookie, expires automatically upon browser close
  
  
end

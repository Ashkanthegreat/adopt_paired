class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :favorite_num

  def favorite_num
    session[:favorites] ||= Array.new()
    session[:favorites].count
  end
end

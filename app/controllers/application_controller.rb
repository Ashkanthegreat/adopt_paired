class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :favorite_num, :favorites

  def favorite_num
    session[:favorites] ||= Array.new()
    session[:favorites].count
  end

  def favorites
    session[:favorites] ||= Array.new()

  end
end

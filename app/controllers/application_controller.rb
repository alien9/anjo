class ApplicationController < ActionController::Base
  protect_from_forgery

  def geocode
    render :json => Mechanize.new.get("http://maps.google.com/maps/api/geocode/json?address=#{CGI::escape(params[:a])}&sensor=false")
  end
end


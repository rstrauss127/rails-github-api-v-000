class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    response = Faraday.post "http://github.com/login/oauth/access_token?client_id=#{ENV["GITHUB_CLIENT"]}&client_secret=#{ENV["GITHUB_SECRET"]}&code=#{params[:code]}"
    puts response
  end
end

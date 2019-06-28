class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    WebMock.disable_net_connect!(allow_localhost: true)
    response = Faraday.post("https://github.com/login/oauth/access_token") do |req|
      req.params[:client_id] = ENV['GITHUB_CLIENT']
      req.params[:client_secret] = ENV['GITHUB_SECRET']
      req.params[:code] = params[:code]
    end
    puts response
  end
end

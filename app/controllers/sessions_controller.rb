class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    client_id = ENV['GITHUB_CLIENT']
    response = Faraday.post("http://github.com/login/oauth/access_token") do |req|
      req.params[:client_id] = client_id
    end
    puts response
  end
end

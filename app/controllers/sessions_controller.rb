class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
    raise params.inspect
  end
end

class ApplicationController < ActionController::Base
  before_action :basic_auth

  private

  def basic_auth
    if Rails.env.production?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["voyage4"] && password == ENV["4egayov"]
      end
    end
  end
end

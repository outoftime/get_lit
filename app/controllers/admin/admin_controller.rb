module Admin
  class AdminController < ApplicationController
    layout 'admin'
    before_filter :authenticate

    private

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == 'admin' &&
          Digest::MD5.hexdigest(password) == 'e954ec556c8754691da9e11eabefaf90'
      end
    end
  end
end

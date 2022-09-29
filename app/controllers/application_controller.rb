class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  before_action :authenticate_user!
  respond_to :json
end

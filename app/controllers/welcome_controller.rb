class WelcomeController < ApplicationController
  skip_before_filter :validate_security_action, :only => [:index]
  def index
  end
end

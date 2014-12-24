class WelcomeController < ApplicationController
  def index
  	@member = Member.find(1)
  	@test = "Hola"
  end
end

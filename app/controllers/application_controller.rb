class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def members
    respond_to do |format|
      @members = Member.where("firstname LIKE '%#{params[:term]}%' OR lastname LIKE '%#{params[:term]}%'")
                     .map { |x| {label: "#{x.FirstName} #{x.LastName}", value: "#{x.FirstName} #{x.LastName}"} }
      format.json { render json: @members }
    end
  end
end

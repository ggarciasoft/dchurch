class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def members
    respond_to do |format|
      @members = Member.where("firstname LIKE '%#{param_term()}%' OR lastname LIKE '%#{param_term()}%'")
                     .map { |x| {label: "#{x.FirstName} #{x.LastName}", value: "#{x.FirstName} #{x.LastName}"} }
      format.json { render json: @members }
    end
  end

  private
  def param_term
    params[:term]
  end
end

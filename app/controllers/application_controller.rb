class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :validate_security_action
  protect_from_forgery with: :exception
  include SessionsHelper

  def members
    respond_to do |format|
      @members = Member.where("firstname LIKE '%#{param_term()}%' OR lastname LIKE '%#{param_term()}%'")
                     .map { |x| {label: "#{x.FirstName} #{x.LastName}", value: "#{x.FirstName} #{x.LastName}"} }
      format.json { render json: @members }
    end
  end

  def current_session_data
    current_user
  end

  private
  def param_term
    params[:term]
  end

  def validate_security_action
    unless logged_in?
      flash[:danger] = 'Por favor, para accesar a esta pagina, debe ingresar primero al sistema.'
      redirect_to login_path
    end
  end
end

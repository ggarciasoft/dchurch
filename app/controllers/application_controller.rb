class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :validate_security_action
  before_action :set_global_session
  protect_from_forgery with: :exception
  include SessionsHelper

  def get_entity_reference
    respond_to do |format|
      term = params[:term]
      source = params[:source]
      entity_references = "";
      if (source == "Member")
        entity_references = Member.where("firstname LIKE '%#{term}%' OR lastname LIKE '%#{term}%'")
                                .collect { |x| {label: "#{x.FirstName} #{x.LastName}", value: "#{x.FirstName} #{x.LastName}"} }
      elsif (source == "ConfigurationCode")
        entity_references = ConfigurationCode.where("firstname LIKE '%#{term}%' OR lastname LIKE '%#{term}%'")
                                .collect { |x| {label: "#{x.FirstName} #{x.LastName}", value: "#{x.FirstName} #{x.LastName}"} }
      end
      format.json { render json: entity_references }
    end
  end

  def set_global_session
    SessionsHelper.set_session(session)
  end

  def current_session_data
    current_user
  end

  private

  def validate_security_action
    unless logged_in?
      flash[:danger] = 'Por favor, para accesar a esta pagina, debe ingresar primero al sistema.'
      redirect_to login_path
    end
  end
end

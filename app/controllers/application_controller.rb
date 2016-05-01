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
      entityType = params[:entityType]
      entity_references = "";
      if (source == "Member")
        entity_references = Member.where("firstname LIKE '%#{term}%' OR lastname LIKE '%#{term}%'")
                                .collect { |x| {value: "#{x.FirstName} #{x.LastName}", id: "#{x.Id}"} }
      elsif (source == "ConfigurationCode")
        entity_references = ConfigurationCodeDetail.joins(:configuration_code)
                                .where("configuration_codes.description LIKE 'EntityType_#{entityType}'
                                      AND configuration_code_details.description LIKE '%#{term}%'")
                                .collect { |x| {value: "#{x.description}", id: "#{x.id}"} }
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

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_dropdown_data, only: [:edit, :new]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Registro guardado satisfactoriamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        set_dropdown_data
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Registro guardado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        set_dropdown_data
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Registro eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  def editpassword
    @user = User.find(current_session_data.user_id)
  end

  def updatepassword
    @user = User.find(current_session_data.user_id)
    respond_to do |format|
      if (params[:user][:id] != current_session_data.user_id.to_s)
        format.html { redirect_to changepassword_path, notice: 'Error al intentar cambiar contraseña.' }
      else
        if @user.update(user_change_password_params)
          format.html { redirect_to changepassword_path, notice: 'Contraseña cambiada satisfactoriamente.' }
        else
          format.html { render editpassword }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def set_dropdown_data
    @entitiesmasters = Entitymaster.all.collect { |m| [m.Description, m.id] }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:Id, :UserName, :FullName, :Email, :Active, :password, :password_confirmation, :entitymaster_id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_change_password_params
    params.require(:user).permit(:Id, :password, :password_confirmation)
  end
end

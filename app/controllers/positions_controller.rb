class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]

  # GET /positions
  # GET /positions.json
  def index
    @positions = Position.all
  end

  # GET /positions/1
  # GET /positions/1.json
  def show
  end

  # GET /positions/new
  def new
    if params[:id] == nil
        @position = Position.new
    else
      set_position
      @position = Position.new(@position.attributes)
    end
  end

  # GET /positions/1/edit
  def edit
  end

  # POST /positions
  # POST /positions.json
  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        if params[:additionalAction] == "saveandnew"
          format.html { redirect_to ({action: "new", id: @position.id}), notice: 'Registro guardado satisfactoriamente.' }
        else
          format.html { redirect_to @position, notice: 'Registro guardado satisfactoriamente.' }
        end
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /positions/1
  # PATCH/PUT /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        if params[:additionalAction] == "saveandnew"
          format.html { redirect_to ({action: "new", id: @position.id}), notice: 'Registro guardado satisfactoriamente.' }
        else
          format.html { redirect_to @position, notice: 'Registro guardado satisfactoriamente.' }
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /positions/1
  # DELETE /positions/1.json
  def destroy
    @position.destroy
    respond_to do |format|
      format.html { redirect_to positions_url, notice: 'Registro eliminado satisfactoriamente.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_position
    @position = Position.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def position_params
    params.require(:position).permit(:Id, :Description, :Active)
  end
end

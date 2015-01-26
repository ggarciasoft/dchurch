class MovementsController < ApplicationController
  before_action :set_movement, only: [:show, :edit, :update, :destroy]
  before_action :set_dropdown_data, only: [:show, :new, :edit]

  # GET /movements
  # GET /movements.json
  def index
    @movements = Movement.all
  end

  # GET /movements/1
  # GET /movements/1.json
  def show
  end

  # GET /movements/new
  def new
    @movement = Movement.new
  end

  # GET /movements/1/edit
  def edit
  end

  # POST /movements
  # POST /movements.json
  def create
    @movement = Movement.new(movement_params)

    respond_to do |format|
      if @movement.save
        if params[:additionalAction] == "saveandnew"
          format.html { render :new, notice: 'Movement was successfully created.' }
        else
          format.html { redirect_to @movement, notice: 'Movement was successfully created.' }
        end
      else
        format.html { render :new }
        format.json { render json: @movement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movements/1
  # PATCH/PUT /movements/1.json
  def update
    respond_to do |format|
      if @movement.update(movement_params)
        format.html { redirect_to @movement, notice: 'Movement was successfully updated.' }
      else
        set_dropdown_data
        format.html { render :edit }
      end
    end
  end

  # DELETE /movements/1
  # DELETE /movements/1.json
  def destroy
    @movement.destroy
    respond_to do |format|
      format.html { redirect_to movements_url, notice: 'Movement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_movement
    @movement = Movement.find(params[:id])
  end

  def set_dropdown_data
    @assets = Asset.all.collect { |m| [m.Description, m.Id] }
    @entityTypes = Entitytype.all.collect { |m| [m.Description, m.Id] }
    @movementTypes = Movementtype.all.collect { |m| [m.Description, m.Id] }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def movement_params
    params.require(:movement).permit(:Id, :MovementDate, :movementtype_id, :entitytype_id, :EntityReference, :asset_id, :AssetQuantity)
  end
end

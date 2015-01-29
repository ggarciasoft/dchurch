class MinistriesController < ApplicationController
	before_action :set_ministry, only: [:show, :edit, :update, :destroy]

	def index
		@ministries = Ministry.all
	end

	def new
		@ministry = Ministry.new
	end

	def create
		@ministry = Ministry.new(ministry_params)

		respond_to do |format|
			if @ministry.save
			if params[:additionalAction] == "saveandnew"
				format.html { redirect_to ({action: "new", id: @ministry.id}), notice: 'Ministerio Creado.' }
			else
				format.html {redirect_to ministries_url, notice: "Ministerio Creado." }
			end
			else
				format.html {render :new}
			end
		end
	end

	def show
	end

	def  edit
	end

	def update
		respond_to do |format|
			if 
				@ministry.update(ministry_params)
				if params[:additionalAction] == "saveandnew"
					format.html { redirect_to ({action: "new", id: @ministry.id}), notice: 'Ministerio Actualizado.' }
				else
					format.html {redirect_to ministries_url, notice: "Ministerio Actualizado." }
				end
			else
				format.html {render :edit}
			end
		end
	end

	def destroy
		@ministry.destroy
		format.html {redirect_to ministries_url , notice: "Ministerio Eliminado." }
	end

	def set_ministry
		@ministry = Ministry.find(params[:id])
	end

	def ministry_params
		params.require(:ministry).permit(:id, :Description, :Active)
	end

end
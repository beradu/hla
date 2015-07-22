class HlasController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def new
  	@hla = current_user.hlas.build
  end

  def index
  	@hlas = Hla.all
  end

  def show
  	@hla = Hla.find(params[:id])
  end

  def create
  @hla = Hla.new(hla_params)
 
  @hla.save
  redirect_to hlas_path
end

  def destroy
		@hla = Hla.find(params[:id])
		@hla.destroy

		redirect_to hlas_path
  end
private
		def set_hla
			@hla = Hla.find(params[:id])
		end
		def correct_user
      	@hla = current_user.hlas.find_by(id: params[:id])
      redirect_to hlas_path, notice: "Not authorized to edit this activity" if @hla.nil?
   		 end
		def hla_params
				params.require(:hla).permit(:title, :comment)
		end		
end

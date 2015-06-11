class DosesController < ApplicationController

  before_action :find_cocktail, only: [:new, :create, :delete]

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktails_path
  end

  #because link between cocktail and dose

  def dose_params
    params.require(:dose).permit(:description, :cocktail, :ingredient)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end

class FlatsController < ApplicationController

  def index
    @flats = params[:query].present? ? Flat.where(title: params[:query]) : Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(set_params)
    @flat.save ? (redirect_to flat_path(@flat)) : (render :new)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(set_params) ? (redirect_to flat_path(@flat)) : (render :new)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path
  end

  private

  def set_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end

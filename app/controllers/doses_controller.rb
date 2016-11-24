class DosesController < ApplicationController

  before_action :set_cocktail, only: [:new, :create, :destroy]

  def index
  end

  def show
  end

  def new
    @dose = Dose.new
  end

  def create
    ingredient = Ingredient.where("LOWER(name) LIKE :query", query: "%#{params[:dose][:ingredient].downcase}%")[0]
    # if ingredient.nil?
    @dose = Dose.new(dose_params)
    @dose.ingredient = ingredient
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete

    redirect_to cocktail_path(@cocktail)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end

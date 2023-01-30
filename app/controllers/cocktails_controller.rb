class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy]


  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail), notice: "Cocktail was successfully created."
  end

  def edit
    @doses = @cocktail.doses
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to edit_cocktail_path(@cocktail)
  end


  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :dose_id, :ingredient_id)
  end

end

require_relative "../models/cocktail"

class CocktailsController < ApplicationController
  before_action :set_cocktail, only: %i[ create show ]

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail), notice: "Cocktail was successfully created."
  end

  def show
  end

  def update
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:name).permit(:dose, :ingredient)
  end

end

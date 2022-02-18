class RecipesController < ApplicationController
before_action :set_recipe, only: [:show, :edit, :update, :destroy]
skip_before_action :authenticate_user!, only: [:destroy, :update, :edit, :new, :create]

  def top
    @recipes = Recipe.where(rating: 5)
    authorize @recipe
  end

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR ingredients ILIKE :query"
      @recipes = Recipe.where(sql_query, query: "%#{params[:query]}%")
    else
      @recipes = policy_scope(Recipe).order(created_at: :desc)
    end
  end

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def show
    @recipe = Recipe.find(params[:id])
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    authorize @recipe

    if @recipe.save
      redirect_to @recipe
    end
  end

  def edit
    authorize @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    authorize @recipe
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    authorize @recipe
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients, :category)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end

class RecipesController < ApplicationController
  before_filter :authenticate_user!
  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
    @recipes_best = Recipe.where("king = ?", true)
    @recipes_challengers = Recipe.where("king = ?", false)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @love = Love.new
    @comments = @recipe.comments
    if current_user
      @already_loved = Love.where("user_id = ? AND recipe_id = ?", current_user, @recipe.id)
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    @recipe.recipe_images.build
    @difficulty = ['Easy', 'Medium', 'Hard']
    

    if params[:challenge]
      @challenge_recipe = params[:challenge]
      @challenge_recipe_name = Dish.find(@challenge_recipe).name
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe.recipe_images.build
  end

  # POST /recipes
  # POST /recipes.json
  def create

    @recipe = current_user.recipes.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  def add_new_comment
    #raise
    @recipe = Recipe.find(params[:id])
    @comment = params[:comment][:comment]
    @recipe.comments.create(:comment => @comment, user_id: current_user.id) 

    respond_to do |format|
      format.html { redirect_to @recipe, notice: "Comment Saved" }
      format.js
    end
  end
end

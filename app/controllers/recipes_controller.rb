class RecipesController < ApplicationController
  layout :resolve_layout
  #before_filter :auth_user, :except => [:show, :index]
  before_filter :authenticate_user!, :except => [:show, :index]
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
    @image = @recipe.recipe_images.first.photo.url if @recipe.recipe_images.count > 0
    @challengers = Recipe.where("dish_id = ? AND king = ?", @recipe.dish_id, false)
    @chef = User.find(@recipe.user_id)
    @dish_object = Dish.find(@recipe.dish_id)
    @dish_name = @dish_object.name # dish name
    @iframe_url = request.original_url

    #if recipe is a challenger
    @competition = Recipe.where("dish_id = ? AND king = ?", @recipe.dish_id, true)
    @winner = @competition.first


    if !current_user.nil?
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

  def iframe
    @recipe = Recipe.find(params[:id])
    @image = @recipe.recipe_images.first.photo.url if @recipe.recipe_images.count > 0
    @chef = User.find(@recipe.user_id)
    @dish = Dish.find(@recipe.dish_id)
  end

  private

  def auth_user
    redirect_to new_user_registration_url unless user_signed_in?
  end

  def resolve_layout
    case action_name
    when "show"
      "fullpage"
    when "iframe"
      "iframe"
    else
      "application"
    end
  end
end

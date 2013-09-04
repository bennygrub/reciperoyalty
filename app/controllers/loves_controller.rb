class LovesController < ApplicationController
  def create
  	#raise
  	@love = Love.new(params[:love])
  	@recipe_id = @love.recipe_id

    respond_to do |format|
      if @love.save
        format.html { redirect_to recipe_path(@recipe_id), notice: "love was successfully created." }
        format.js
      end
    end
  end

  def destroy
    @love = Love.find(params[:id])
    @love.destroy

    respond_to do |format|
      format.html { redirect_to loves_url }
      format.json { head :no_content }
    end
  end
end

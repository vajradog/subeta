class CategoriesController < ApplicationController
	before_filter :authenticate_user!, except: [:index, :show]
  
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "New category saved"
			redirect_to categories_path
		else
			flash[:error] = "Could not save category"
			render :new
		end		
	end

	def show
		@category = Category.find(params[:id])
	end

	def edit
		@category = Category.find(params[:id])
		
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:notice] = "Category name updated"
			redirect_to category_path
		else
			flash[:error] = "Category name could not be updated"
			render 'edit'
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path
		
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end
end
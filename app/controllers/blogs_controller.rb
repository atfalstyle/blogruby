class BlogsController < ApplicationController

	before_action :find_id, only: [:show, :update, :edit, :destroy]

	# GET From Database
	def index
		# Set a variable to all Blogs inside to database.
		@blogs = Blog.all
	end

	# GET From Database.
	def show
	end

	# GET RENDER
	def new
		@blog = Blog.new
	end

	# Post To Database
	def create
		@blog = Blog.create(define_params)

		if @blog.save
			redirect_to root_path
		else
			render :new
		end
	end

	# GET Render
	def edit
	end

	# UPDATE / PUT On Datbase
	def update
		if @blog.update(define_params)
			redirect_to root_path
		else
			render :edit
		end
	end

	def destroy
		@blog.destroy
		redirect_to root_path
	end


	private

	def find_id
		@blog = Blog.find(params[:id])
	end

	def define_params
		params.require(:blog).permit(:title, :content)
	end
end

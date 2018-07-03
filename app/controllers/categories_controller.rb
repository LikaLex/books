class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [ :edit]



  def index
    @category = Category.all.order("created_at DESC")
  end

  def new
    @category = Category.new

  end

  def create
    @category = Category.new(category_params)


    if @category.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit

  end


  def update

    if @category.update(category_params)
      redirect_to root_path
    else
      render 'edit'
    end

  end
  def show
    @category  = Category.find(params[:id])
  end

  def destroy
    @category.destroy
    redirect_to root_path

  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])

  end
end

class AgesController < ApplicationController
  before_action :find_age, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [ :edit]



  def index
    @age = Age.all.order("created_at DESC")
  end

  def new
    @age = Age.new

  end

  def create
    @age = Age.new(age_params)


    if @age.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit

  end


  def update

    if @age.update(age_params)
      redirect_to root_path
    else
      render 'edit'
    end

  end
  def show
    @age  = Age.find(params[:id])
  end

  def destroy
    @age.destroy
    redirect_to root_path

  end

  private
  def age_params
    params.require(:age).permit(:name)
  end

  def find_age
    @age = Age.find(params[:id])

  end
end

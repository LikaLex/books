class PublishersController < ApplicationController
  before_action :find_publisher, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def search
    if params[:search].present?
      @publishers = Publisher.search(params[:search])
    else
      @publishers = Publisher.all
    end
  end
  
  def index
    @publishers = Publisher.all.order("created_at DESC").paginate(page: params[:page], per_page:8)
  end

  def new
    @publisher = Publisher.new

  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to publishers_path
    else
      render 'new'
    end

  end

  def edit

  end


  def update

    if @publisher.update(publisher_params)
      redirect_to publishers_path(@publisher)
    else
      render 'edit'
    end

  end
  def show
    @publisher  = Publisher.find(params[:id])
  end

  def destroy
    @publisher.destroy
    redirect_to publishers_path

  end

  private
  def publisher_params
    params.require(:publisher).permit(:title, :description, :publisher_avatar, :foundation_date, :country, :ceo, :founder)
  end

  def find_publisher
    @publisher = Publisher.find(params[:id])

  end
end

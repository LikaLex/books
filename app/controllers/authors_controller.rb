class AuthorsController < ApplicationController
  before_action :find_author, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [ :edit]

  def search
    if params[:search].present?
      @authors = Author.search(params[:search])
    else
      @authors = Author.all
    end
    end

  def index
    @authors = Author.all.order("created_at DESC").paginate(page: params[:page], per_page:8)
  end

  def new
    @author = Author.new

  end

  def create
    @author = Author.new(author_params)


    if @author.save
      redirect_to authors_path
    else
      render 'new'
    end

  end

  def edit

  end


  def update

    if @author.update(author_params)
      redirect_to authors_path(@author)
    else
      render 'edit'
    end

  end
  def show
    @author  = Author.find(params[:id])
  end

  def destroy
    @author.destroy
    redirect_to authors_path

  end

  private
  def author_params
    params.require(:author).permit(:name, :about, :author_avatar, :age, :gender_id)
  end

  def find_author
    @author = Author.find(params[:id])

  end
end

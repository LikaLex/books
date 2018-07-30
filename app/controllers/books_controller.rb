class BooksController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]

  def search
    if params[:search].present?
      @books = Book.search(params[:search])
    else
      @books = Book.all
    end
  end
  def index
    if params[:category].blank?
      @books = Book.all.order("created_at DESC").paginate(page: params[:page], per_page:8)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @books = Book.where(:category_id => @category_id).order("created_at DESC").paginate(page: params[:page], per_page:4)
    end

  end

  def show
    if @book.reviews.blank?
      @average_review = 0
    else
      @average_review = @book.reviews.average(:rating).round(2)
    end
  end

  def new
    @book = current_user.books.build
    @categories = Category.all.map{|c| [c.name, c.id]}
    @authors = Author.all.map{|a| [a.name, a.id]}
    @publishers = Publisher.all.map{|p| [p.title, p.id]}
    @ages = Age.all.map{|a| [a.name, a.id]}


  end

  def create
    @book = current_user.books.build(book_params)
    @book.category_id  = params[:category_id]
    @book.author_id  = params[:author_id]
    @book.publisher_id  = params[:publisher_id]
    @book.age_id = params[:age_id]

    if @book.save
      redirect_to root_path
    else
      render 'new'
    end

  end

  def edit
    @categories = Category.all.map{|c| [c.name, c.id]}
    @authors = Author.all.map{|a| [a.name, a.id]}
    @publishers = Publisher.all.map{|p| [p.title, p.id]}
    @ages = Age.all.map{|a| [a.name, a.id]}

  end

  def update
    @book.category_id  = params[:category_id]
    @book.author_id  = params[:author_id]
    @book.publisher_id  = params[:publisher_id]
    @book.age_id = params[:age_id]

    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end

  end

  def destroy
    @book.destroy
    redirect_to root_path

  end

  private

  def book_params
    params.require(:book).permit(:title, :description,
                                 :category_id, :book_img, :price,
                                 :publication_year, :number_of_pages,
                                 :author_id, :publisher_id, :age_id, :language)
  end

  def find_book
    @book = Book.find(params[:id])

  end
end

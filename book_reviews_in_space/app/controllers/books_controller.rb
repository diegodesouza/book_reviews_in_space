class BooksController < ApplicationController
  def index
    @books = Book.order('created_at DESC')
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Your have successfully added a new book."
      redirect_to @book
    else
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :url)
  end
end

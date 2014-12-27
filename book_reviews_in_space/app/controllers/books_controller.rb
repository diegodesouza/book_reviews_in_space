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
    @book.user_id = current_user.id
    # binding.pry
    if @book.save
      flash[:notice] = "Your have successfully added a new book."
      redirect_to @book
    else
      render action: 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path
    else
      render action: "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :action => "index"
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :url)
  end

end

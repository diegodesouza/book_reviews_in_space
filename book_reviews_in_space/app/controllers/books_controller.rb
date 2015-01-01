class BooksController < ApplicationController

  def index
    @books = Book.order('created_at DESC')
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
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
    if !correct_user?
      flash[:alert] = "You don't have permission to do that."
      redirect_to root_path
    end
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
    if !correct_user?
      flash[:alert] = "You don't have permission to do that."
      redirect_to :action => "index" and return
    end
    @book.destroy
    redirect_to :action => "index"
  end

  private

  def correct_user?
    @book = Book.find(params[:id])
    current_user == @book.user
  end

  def book_params
    params.require(:book).permit(:title, :description, :url)
  end

end

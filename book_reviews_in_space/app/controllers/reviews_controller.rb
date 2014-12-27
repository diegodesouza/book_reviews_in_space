class ReviewsController < ApplicationController
  def index
    @reviews = Review.order('reviews.created_at DESC')
  end

  def show
    @review = Review.find(params[:book_id])
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.new(review_params)
    if @review.save
      redirect_to book_path(@book)
    else
      flash[:warning] = @review.errors.full_messages.join('. ')
      redirect_to book_path(@book)
    end
  end

  def edit
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to book_path
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to book_path
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end

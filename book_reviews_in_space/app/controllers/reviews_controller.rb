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
    @review = Review.find(params[:id])
    @book = Book.find(params[:book_id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to @review
    else
      @review.edit
    end
  end

  def destroy
    Review.destroy(params[:id])
    redirect_to book_path
  end
  private

  def review_params
    params.require(:review).permit(:description)
  end
end

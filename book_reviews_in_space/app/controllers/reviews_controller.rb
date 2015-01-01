class ReviewsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.book = @book
    if @review.save
      flash[:notice] = "You have successfully created a review"
      redirect_to book_path(@book)
    else
      flash[:warning] = @review.errors.full_messages.join('. ')
      redirect_to book_path(@book)
    end
  end

  def edit
      @book = Book.find(params[:book_id])
      @review = Review.find(params[:id])
    if !correct_user?
      flash[:alert] = "You don't have permission to do that."
      redirect_to book_path(@book)
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(review_params)
      redirect_to book_path(params[:book_id]),
      :notice => "Successfully Updated"
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:book_id])
    @review = Review.find(params[:id])
    if !correct_user?
      flash[:alert] = "You don't have permission to do that."
      redirect_to book_path(@book) and return
    end
    @review.destroy
    redirect_to book_path(@book)
  end

  private

  def correct_user?
    @review = Review.find(params[:id])
    current_user == @review.user
  end

  def review_params
    params.require(:review).permit(:description)
  end
end

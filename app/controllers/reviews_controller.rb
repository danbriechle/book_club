class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @book = Book.find(params[:book_id])
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    user_id = @review.user_id
    @review.destroy
    redirect_to user_path(user_id)
  end

  def create
    book = Book.find(params[:book_id])
      if User.find_by(name: params[:review][:user]) == nil
      user = User.find_or_create_by(name: params[:review][:user].titlecase)
      hash = review_params
      hash[:user_id]= user[:id]
      review = book.reviews.create(hash)

      redirect_to book_path(review.book_id)
      else
      redirect_to new_book_review_path(book)
      end
  end

  private

  def review_params
    rp = params.require(:review).permit(:title, :description, :score, :user)
    {title: rp[:title], description: rp[:description], score: rp[:score]}
  end


end

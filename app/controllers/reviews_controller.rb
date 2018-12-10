class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
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
end

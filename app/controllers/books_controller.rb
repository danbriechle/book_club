class BooksController < ApplicationController

  def index
    @books = Book.all
    
  end

  def show
    @book = Book.find(params[:id])
    @top_three_reviews = Review.top_three
    @bottom_three_reviews = Review.bottom_three
    @average_score = Review.average_score
  end

end

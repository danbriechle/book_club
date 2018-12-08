class BooksController < ApplicationController

  def index
    @books = Book.all
    top_three_book_id = Review.top_three.pluck(:book_id)
    @top_books = @books.find([top_three_book_id])
    worst_book_id = Review.bottom_three.pluck(:book_id)
    @worst_books = @books.find([worst_book_id])
  end

  def show
    @book = Book.find(params[:id])
    @top_three_reviews = Review.top_three
    @bottom_three_reviews = Review.bottom_three
    @average_score = Review.average_score
  end

end

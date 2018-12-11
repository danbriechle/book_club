class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])
    author_id = @author.id
    book_authors = BookAuthor.where(author_id: params[:id])
    BookAuthor.delete(book_authors)
    @books = @author.books

    @books.each do |book|
      book.reviews.each do |review|
        Review.delete(review.id)
      end
      Book.delete(params[book.id])
    end
    
    Author.delete(@author.id)

    redirect_to books_path
  end

end

class BooksController < ApplicationController

  def index
    if params[:column] == 'rating' && params[:order] == 'asc'
      @books = Book.sort_by_average_rating
    elsif params[:column] == 'rating' && params[:order] == 'desc'
      @books = Book.sort_by_average_rating(:desc)
    elsif params[:column] == 'pages' && params[:order] == 'asc'
      @books = Book.sort_by_book
    elsif params[:column] == 'pages' && params[:order] == 'desc'
      @books = Book.sort_by_book(:desc)
    elsif params[:column] == 'reviews' && params[:order] == 'asc'
      @books = Book.sort_by_total_scores
    elsif params[:column] == 'reviews' && params[:order] == 'desc'
      @books = Book.sort_by_total_scores(:desc)
    else
      @books = Book.all
    end

    
    @top_books = Book.get_by_reviews(:desc)
    @worst_books =  Book.get_by_reviews(:asc)
    @most = User.top_users_with_the_most_reviews

  end

  def show
    @book = Book.find(params[:id])
    @top_three_reviews = @book.reviews.top_three
    @bottom_three_reviews = @book.reviews.bottom_three
    @average_score = @book.reviews.average_score
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.create(book_params)
    authors = author_params[:name].split(",")
    authors.each do |author|
      book.authors.create(name: author)
    end
    redirect_to book_path(book.id)
  end

  def destroy
    book_authors = BookAuthor.where(book_id: params[:id])
    BookAuthor.delete(book_authors)
    reviews = Review.where(book_id: params[:id])
    Review.delete(reviews)
    Book.delete(params[:id])
    redirect_to books_path
  end

  private

  def book_params
    retianed_params = params.require(:book).permit(:title, :year, :pages, :image_url, :authors)
    {title: retianed_params[:title].titlecase, year: retianed_params[:year], pages: retianed_params[:pages], image_url: retianed_params[:image_url]}
  end

  def author_params
    retianed_params = params.require(:book).permit(:authors)
    {name: retianed_params[:authors].titlecase}
  end


end

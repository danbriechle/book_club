class BooksController < ApplicationController

  def index
    @books = Book.sort_by_average_rating
    @top_books = Book.get_by_reviews(:desc)
    @worst_books =  Book.get_by_reviews(:asc)
    most_reviews_id = Review.top_reviews_count.pluck(:user_id)
    @most = User.find([most_reviews_id])

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

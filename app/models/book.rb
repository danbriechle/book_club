class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :pages
  validates_presence_of :year
  validates_presence_of :image_url

  has_many :reviews
  has_many :book_authors, dependent: :destroy
  has_many :authors, through: :book_authors

  def self.get_by_reviews(order)
   joins(:reviews).order("reviews.score #{order}").limit(3)
  end

  def self.sort_by_book(order = :asc)
    Book.order(pages: order)
  end

  def self.sort_by_average_rating(order = :asc)
      Book.joins(:reviews)
      .select("books.*, avg(reviews.score) as rating")
      .order("rating #{order}")
      .group(:id)
  end

  def self.sort_by_total_scores(order = :asc)
      Book.joins(:reviews)
      .select("books.*, count(reviews) as count ")
      .order("count #{order}")
      .group(:id)
  end






end

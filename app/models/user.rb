class User < ApplicationRecord
  validates_presence_of :name
  has_many :reviews

  def self.sort_by_newest_reviews
    Review.order(created_at: :desc)
  end

  def self.sort_by_oldest_reviews
    Review.order(created_at: :asc)
  end
end

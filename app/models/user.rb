class User < ApplicationRecord
  validates_presence_of :name
  has_many :reviews

  def sort_by_review_age(order = :asc)
    reviews.order(created_at: order)
  end

  def self.top_users_with_the_most_reviews
    User.joins(:reviews)
    .select("users.*, count(reviews) as count")
    .order('count desc')
    .group(:id)
    .limit(3)
  end
end

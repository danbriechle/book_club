class Review < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :score
  belongs_to :book
  belongs_to :user


  def self.top_three
    Review.order(score: :desc).limit(3)
  end

  def self.bottom_three
    Review.order(score: :asc).limit(3)
  end

  def self.average_score
    Review.average(:score)
  end

  def self.top_reviews_count
    Review.distinct.order(user_id: :asc).limit(3)
  end


end

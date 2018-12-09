class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @new_reviews = User.sort_by_newest_reviews
    @old_reviews = User.sort_by_oldest_reviews
  end
end

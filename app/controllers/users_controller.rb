class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if params[:sort] == 'asc'
    @reviews = @user.sort_by_review_age
    elsif params[:sort] == 'desc'
    @reviews = @user.sort_by_review_age(:desc)
    else
    @reviews = @user.reviews
    end
  end
end

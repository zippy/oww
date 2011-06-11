class UsersController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!
  def show
    @user = User.find(params[:id])
    respond_with @user
  end
  def reviewer_history
    @user = User.find(params[:id])
    @reviews = @user.reviews
    respond_with @reviews
  end

end

class ReviewsController < ApplicationController
  respond_to :html
  # GET /reviews
  def index
    @reviews = Review.all
    respond_with @reviews
  end

  # GET /reviews/1
  def show
    @review = Review.find(params[:id])
    respond_with @review
  end

  # GET /reviews/new
  def new
    @review = Review.new
    respond_with @review
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
    respond_with @review
  end

  # POST /reviews
  def create
    @review = Review.new(params[:review])
    if @review.save
      flash[:notice] = 'Review was successfully created.'
    end
    respond_with @review
  end

  # PUT /reviews/1
  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      flash[:notice] = 'Review was successfully updated.'
    end
    respond_with @review
  end

  # DELETE /reviews/1
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    respond_with @review
  end
end

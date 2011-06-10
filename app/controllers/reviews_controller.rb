class ReviewsController < ApplicationController
  respond_to :html
  # GET /submissions/1/reviews
  def index
    @submission = Submission.find(params[:submission_id])
    @reviews = @submission.reviews
    respond_with @reviews
  end

  # GET /submissions/1/reviews/1
  def show
    @review = Review.find(params[:id])
    respond_with @review
  end

  # GET /submissions/1/reviews/new
  def new
    @submission = Submission.find(params[:submission_id])
    @review = @submission.reviews.build
    respond_with @review
  end

  # GET /submissions/1/reviews/1/edit
  def edit
    @submission = Submission.find(params[:submission_id])
    @review = Review.find(params[:id])
    respond_with @review
  end

  # POST /reviews
  def create
    @submission = Submission.find(params[:submission_id])
    @review = @submission.reviews.build(params[:review])
    @review.user = current_user
    if @review.save
      current_user.adjust_points_for(current_shop,:reviewing)
      flash[:notice] = 'Review was successfully created.'
    end
    respond_with @review,:location => submission_reviews_path(@submission)
  end

  # PUT /submission/1/reviews/1
  def update
    @submission = Submission.find(params[:submission_id])
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review])
      flash[:notice] = 'Review was successfully updated.'
    end
    respond_with @review,:location => submission_reviews_path(@submission)
  end

  # DELETE /submission/1/reviews/1
  def destroy
    @submission = Submission.find(params[:submission_id])
    @review = Review.find(params[:id])
    @review.destroy
    respond_with @review
  end
end

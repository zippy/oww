class SubmissionsController < ApplicationController

  respond_to :html
  # GET /submissions
  def index
    @submissions = Submission.all
    respond_with @submissions
  end

  # GET /submissions/1
  def show
    @submission = Submission.find(params[:id])
    respond_with @submission
  end

  # GET /submissions/new
  def new
    @submission = Submission.new
    respond_with @submission
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
    respond_with @submission
  end

  # POST /submissions
  def create
    @submission = Submission.new(params[:submission])
    @submission.user_id = current_user.id
    @submission.shop = current_shop
    if @submission.save
      current_user.adjust_points_for(current_shop,:submitting)
      flash[:notice] = 'Submission was successfully created.'
    end
    respond_with @submission
  end

  # PUT /submissions/1
  def update
    @submission = Submission.find(params[:id])

    if @submission.update_attributes(params[:submission])
      flash[:notice] = 'Submission was successfully updated.'
    end
    respond_with @submission
  end

  # DELETE /submissions/1
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    flash[:notice] = "Successfully destroyed sumbission."  
    respond_with @submission
  end
end

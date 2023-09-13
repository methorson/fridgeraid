class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to reviews_path(@review)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to reviews_path
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating) # include :comment in review model in validates?
  end
end

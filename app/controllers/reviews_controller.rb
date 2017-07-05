class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :destroy]
    before_action :logged_in_user, only: [:create, :edit, :destroy]
    

    def index
        @reviews = Review.all
        if params[:search]
            @reviews = Review.search(params[:search]).order("created_at DESC")
        else
            @reviews = Review.all.order("created_at DESC")
        end
    end
    
    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            flash[:success] = "Review created!"
            redirect_to root_url
        else
            @feed_items = []
            render 'static_pages/home'
        end
    end
    
    def destroy
        @review.destroy
        flash[:success] = "Review deleted"
        redirect_to request.referrer || root_url
    end
    
    private

        # Use callbacks to share common setup or constraints between actions.
        def set_review
          @review = Review.find(params[:id])
        end
        
        
        def review_params
          params.require(:review).permit(:course, :year, :professor, :semester, :content, :user_id)
        end
        
        def correct_user
          @review = current_user.reviews.find_by(id: params[:id])
          redirect_to root_url if @review.nil?
        end
end

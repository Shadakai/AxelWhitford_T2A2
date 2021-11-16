class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    # find the listing with the assoiciated ID. (should be the one you are in)
    @listing = Listing.find(params[:listing_id])
    # Create the comment attached to this listing
    @comment = @listing.comments.create(comment_params)
    # Assign the logged in user
    @comment.user_id = current_user.id if current_user
    @comment.save!
    redirect_to listing_path(@listing)
  end

  def destroy
    # find the current listing 
    @listing = Listing.find(params[:listing_id])
    # find the current comment
    @comment = @listing.comments.find(params[:id])
    # delete it
    @comment.destroy 
    redirect_to listing_path(parans[:id])
  end

  private 

  def comment_params
    params.require(:comment).permit(:name, :response)
  end
end

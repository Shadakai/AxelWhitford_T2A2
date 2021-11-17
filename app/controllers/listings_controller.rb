class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ edit update destroy ]
  impressionist action: [:show], unique: [:impressionable_type, :impressionable_id, :session_hash]

  # GET /listings
  def index
    @listings = Listing.all.order('created_at DESC')
  end

  # GET /listings/1 
  def show
  end

  # GET /listings/new
  def new
    @listing = current_user.listings.build
  end

  # GET /listings/1/edit
  def edit
  end

  #Get /search
  def search 
    @listings = Listing.where("title LIKE ?" , "%#{params[:query]}%")
    render "index"
  end

  # POST /listings 
  def create
    # have to pass user id
    @listing = Listing.new(listing_params)
    redirect_to listings_path
    begin
      @listing.save!
      redirect_to @listings
    rescue
      flash.now[:errors] = "error"
    end
  end

  # PATCH/PUT /listings/1 or /listings/1
  def update
    @listing.update(listing_params)
  end

  # DELETE /listings/1 or /listings/1
  def destroy
    @listing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :description, :potion_image, :user_id, :price)
    end
end

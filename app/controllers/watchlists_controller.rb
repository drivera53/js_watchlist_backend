class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: [:show, :update, :destroy]

  # GET /watchlists
  def index
    @watchlists = Watchlist.all

    render json: @watchlists, except: [:updated_at]
  end

  # GET /watchlists/1
  def show
    # render json: @watchlist
    render json: @watchlist.coins, only: [:id]
  end
  # def show
  #   watchlist = Watchlist.find(params[:id])
  #   render json: WatchlistSerializer.new(watchlist)
  # end

  # POST /watchlists
  def create
    @watchlist = Watchlist.new(watchlist_params)

    if @watchlist.save
      render json: {
        status: 201,
        watchlist: @watchlist
      }, status: :created, location: @watchlist
    else
      render json: {
        status: 422,
        errors: @watchlist.errors.full_messages.join(", ")
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /watchlists/1
  def update
    if @watchlist.update(watchlist_params)
      render json: {
        status: 200,
        watchlist: @watchlist
    }
    else
      render json: {
        status: 400,
        errors: @watchlist.errors.full_messages.join(", ")
        }, status: :unprocessable_entity
    end
  end

  # DELETE /watchlists/1
  def destroy
    if @watchlist.destroy
      render json: {message: "Successfully deleted", watchlist: @watchlist}
    else
      render json: {message: "Failed to delete"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watchlist
      @watchlist = Watchlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watchlist_params
      params.require(:watchlist).permit(:name, :description)
    end
end

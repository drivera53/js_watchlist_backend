class WatchlistCoinsController < ApplicationController
  before_action :set_watchlist_coin, only: [:show, :update, :destroy]

  # GET /watchlist_coins
  def index
    @watchlist_coins = WatchlistCoin.all

    render json: @watchlist_coins
  end

  # GET /watchlist_coins/1
  def show
    render json: @watchlist_coin
  end

  # POST /watchlist_coins
  def create
    @watchlist_coin = WatchlistCoin.new(watchlist_coin_params)

    if @watchlist_coin.save
      render json: @watchlist_coin, status: :created, location: @watchlist_coin
    else
      render json: @watchlist_coin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /watchlist_coins/1
  def update
    if @watchlist_coin.update(watchlist_coin_params)
      render json: @watchlist_coin
    else
      render json: @watchlist_coin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /watchlist_coins/1
  def destroy
    @watchlist_coin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watchlist_coin
      @watchlist_coin = WatchlistCoin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watchlist_coin_params
      params.require(:watchlist_coin).permit(:coin_id, :wathlist_id)
    end
end

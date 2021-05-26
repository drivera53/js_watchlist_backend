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
    coin = Coin.find_by_name(params[:coin_name])
    if coin.nil?
      coin_id = ""
    else
      coin_id = coin.id
    end

    @watchlist_coin = WatchlistCoin.new(coin_id: coin_id, watchlist_id: params[:watchlist_id])
    if @watchlist_coin.save 
      render json: {
        status: 201,
        watchlist_coin: @watchlist_coin
      } , status: :created, location: @watchlist_coin
    else
      render json: {
        status: 422,
        errors: @watchlist_coin.errors.full_messages.join(", ") 
      }, status: :unprocessable_entity
    end
  end

  # def create
  #   @watchlist_coin = WatchlistCoin.new(watchlist_coin_params)

  #   if @watchlist_coin.save
  #     render json: @watchlist_coin, status: :created, location: @watchlist_coin
  #   else
  #     render json: @watchlist_coin.errors, status: :unprocessable_entity
  #   end
  # end

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

  # SPECIAL DELETE /watchlist_coins/special_delete/:coin_id/:watchlist_id'
  def special_delete
    watchlist = Watchlist.find_by_id(params[:watchlist_id])
    watchlist_coin_id = ""
    watchlist.watchlist_coins.each do |watchlist_coin|
      # puts(watchlist_coin.coin_id)
      if watchlist_coin.coin_id == params[:coin_id].to_i
        watchlist_coin_id = watchlist_coin.id
          # puts("Yeah they are equal!")
      end
    end
    # Watchlist_coin
    watchlist_coin = WatchlistCoin.find_by_id(watchlist_coin_id)

    if watchlist_coin.destroy
      render json: {message: "Successfully deleted", watchlist_coin: watchlist_coin}
    else
      render json: {message: "Failed to delete"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watchlist_coin
      @watchlist_coin = WatchlistCoin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watchlist_coin_params
      params.require(:watchlist_coin).permit(:coin_id, :watchlist_id)
    end
end

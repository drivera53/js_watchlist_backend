class CoinsController < ApplicationController
  before_action :set_coin, only: [:show, :update, :destroy]

  # GET /coins
  def index
    @coins = Coin.all

    render json: @coins, except: [:created_at, :updated_at, :current_price, :price_change_percentage_1h_in_currency, :high_24h, :low_24h, :total_volume, :market_cap, :market_cap_rank, :circulating_supply] 
  end

  # GET /coins/1
  # def show
  #   render json: @coin
  # end
  
  def show
    coin = Coin.find(params[:id]) 
    require 'net/http'
    url = url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=#{coin.coin_api_id}&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=1h"
    request = URI.parse(url)
    response = Net::HTTP.get_response(request)
    crypto_hash = JSON.parse(response.body)
    coin.current_price = crypto_hash[0]['current_price']
    coin.price_change_percentage_1h_in_currency = crypto_hash[0]['price_change_percentage_1h_in_currency']
    coin.high_24h = crypto_hash[0]['high_24h']
    coin.low_24h = crypto_hash[0]['low_24h']
    coin.total_volume = crypto_hash[0]['total_volume']
    coin.market_cap = crypto_hash[0]['market_cap']
    coin.market_cap_rank = crypto_hash[0]['market_cap_rank']
    coin.circulating_supply = crypto_hash[0]['circulating_supply']

    # Serializer
    render json: CoinSerializer.new(coin)
  end
  # POST /coins
  def create
    @coin = Coin.new(coin_params)

    if @coin.save
      render json: @coin, status: :created, location: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /coins/1
  def update
    if @coin.update(coin_params)
      render json: @coin
    else
      render json: @coin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /coins/1
  def destroy
    @coin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coin_params
      params.require(:coin).permit(:coin_api_id, :name, :symbol)
    end
end

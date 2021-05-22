require "test_helper"

class WatchlistCoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watchlist_coin = watchlist_coins(:one)
  end

  test "should get index" do
    get watchlist_coins_url, as: :json
    assert_response :success
  end

  test "should create watchlist_coin" do
    assert_difference('WatchlistCoin.count') do
      post watchlist_coins_url, params: { watchlist_coin: { coin_id: @watchlist_coin.coin_id, watchlist_id: @watchlist_coin.watchlist_id } }, as: :json
    end

    assert_response 201
  end

  test "should show watchlist_coin" do
    get watchlist_coin_url(@watchlist_coin), as: :json
    assert_response :success
  end

  test "should update watchlist_coin" do
    patch watchlist_coin_url(@watchlist_coin), params: { watchlist_coin: { coin_id: @watchlist_coin.coin_id, watchlist_id: @watchlist_coin.watchlist_id } }, as: :json
    assert_response 200
  end

  test "should destroy watchlist_coin" do
    assert_difference('WatchlistCoin.count', -1) do
      delete watchlist_coin_url(@watchlist_coin), as: :json
    end

    assert_response 204
  end
end

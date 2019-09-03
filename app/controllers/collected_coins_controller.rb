class CollectedCoinsController < ApplicationController
  before_action :authenticate_user!

  def create
    @collected_coin = CollectedCoin.create user: current_user
  end
end

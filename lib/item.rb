class Item
  attr_reader :name, :bids, :open

  def initialize(name)
    @name = name
    @bids = {}
    @open = true
  end

  def add_bid(bidder, bid)
    if @open == true
      @bids[bidder] = bid 
    else
      "Bidding closed on this item."
    end
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
    @open = false
  end
end
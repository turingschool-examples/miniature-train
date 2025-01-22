class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(bidder, bid)
    if bidder.budget >= bid
      @bids[bidder] => bid 
    end
  end

  def current_high_bid
    amounts = []
    @bids.max_by do |key, value|
      value
    end
  end
end
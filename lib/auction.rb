class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids.empty? == true
    end
  end

  def potential_revenue
    @items.sum do |item|
      item.current_high_bid
    end
  end

  def bidders
    names = []
    @items.each do |item|
      item.bids.each do |bidder, value|
        names << bidder.name
      end
    end
    return names
  end

  def bidder_items(attendee)
    bids = []
    bids.each do |item, bidders|
      bidders.each do |bidder|  #if statement is weird
        if bidder == attendee   #maybe not even possible to access item from where I'm trying to add it
          bids << item
        end
      end
    end
    return bids
  end



  
end
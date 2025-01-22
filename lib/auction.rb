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
            item.bids.empty?
        end
    end

    # def potential_revenue
    #     total_revenue = 0
    #     @items.each do |item|
    #       total_revenue += item.current_high_bid if item.current_high_bid
    #     end
    #     total_revenue
    # end

    def potential_revenue 
        @items.sum do |item|
            item.current_high_bid || 0
        end
    end

    # def bidders
    #     @items.flat_map do |item|
    #         item.bids.keys.compact.map do |attendee|
    #             attendee.name
    #         end
    #     end.uniq
        
    # end

end
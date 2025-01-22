require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do 
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    @auction = Auction.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@auction).to be_a Auction
    end
  end

  describe '#items' do
    it 'defaults an empty array' do 
      expect(@auction.items).to eq ([])
    end

    it 'can add items to array via add_item method' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.items).to eq ([@item1, @item2])
    end
  end

  describe '#item_names' do
    it 'returns list of names of item objects in items array' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)

      expect(@auction.item_names).to eq(['Chalkware Piggy Bank', 'Bamboo Picture Frame'])
    end
  end
  
  describe '#unpopular_items' do
    it 'returns array of items with no bids' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expect(@auction.unpopular_items).to eq([@item2])
    end
  end

  describe '#potential_revenue' do
    it 'totals highest bids across all items.' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      @item1.add_bid(@attendee2, 20)
      @item2.add_bid(@attendee1, 22)

      expect(@auction.potential_revenue).to eq(42)
    end
  end
end


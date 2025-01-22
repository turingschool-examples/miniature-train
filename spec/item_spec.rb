require './lib/item'
require './lib/attendee'
require 'pry'

RSpec.describe Item do 
  before(:each) do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @bidder1 = Attendee.new({name: 'Megan', budget: '$50'})
    @bidder2 = Attendee.new({name: 'Bob', budget: '$75'})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@item1).to be_a Item
      expect(@item2).to be_a Item
    end

    it 'has attributes' do
      expect(@item1.name).to eq("Chalkware Piggy Bank")
      expect(@item2.name).to eq("Bamboo Picture Frame")
    end
  end

  describe '#bids' do
    it 'defults empty hash for item bids' do
      expect(@item1.bids).to eq({})
      expect(@item2.bids).to eq({})

    end

    it 'add_bid to item hash' do
      @item1.add_bid(@bidder2, 20)
      @item1.add_bid(@bidder1, 22)


      expect(@item1.bids).to eq({@bidder2 => 20, @bidder1 => 22})
    end
  end

  describe '#current_high_bids' do
    it 'returns highest bid placed on item' do
      @item1.add_bid(@bidder2, 20)
      @item1.add_bid(@bidder1, 22)

      expect(@item1.current_high_bid).to eq(22)
    end
  end
end

 
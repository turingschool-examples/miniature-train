require './lib/item'
require 'rspec'

RSpec.describe Item do
    before(:each) do
        @item1 = Item.new('Chalkware Piggy Bank')
    end

    it 'exists and has attributes' do
        expect(@item1).to be_an_instance_of(Item)
        expect(@item1.name).to eq('Chalkware Piggy Bank')
        expect(@item1.bids).to eq({})
    end

    it 'can add bids and returns the sum of all the highest bids' do 
        @item1.add_bid(@attendee2, 20)
        @item1.add_bid(@attendee1, 22)

        expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
        expect(@item1.current_high_bid).to eq(22)
        
    end

end
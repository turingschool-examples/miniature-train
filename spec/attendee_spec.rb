require './lib/attendee'
require 'rspec'

RSpec.describe Attendee do
    before(:each) do
        @attendee = Attendee.new({name: 'Megan', budget: '$50'})
        @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
        @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

    end

    it 'exists and has attributes' do
        expect(@attendee).to be_an_instance_of(Attendee)
        expect(@attendee.name).to eq('Megan')
        expect(@attendee.budget).to eq(50)
        expect(@attendee2.name).to eq('Bob')
        expect(@attendee3.name).to eq('Mike')

    end
end
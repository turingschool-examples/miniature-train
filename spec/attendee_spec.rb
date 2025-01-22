require './lib/attendee'

RSpec.describe Attendee do 
  before(:each) do
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  describe '#initialize' do
    it 'exists' do
      expect(@attendee1).to be_a Attendee
      expect(@attendee2).to be_a Attendee
      expect(@attendee3).to be_a Attendee

    end

    it 'has a name' do
      expect(@attendee1.name).to eq('Megan')
      expect(@attendee2.name).to eq('Bob')
      expect(@attendee3.name).to eq('Mike')

    end

    it 'has a budget' do
      expect(@attendee1.budget).to eq(50)
      expect(@attendee2.budget).to eq(75)
      expect(@attendee3.budget).to eq(100)
    end
  end
end
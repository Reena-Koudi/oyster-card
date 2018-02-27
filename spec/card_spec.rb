require 'card'
describe Card do
  let(:entry_station) { double('entry_station') }
  let(:exit_station) { double('exit_station') }
  subject(:card) { described_class.new }
  describe '#balance' do
    it 'should return balance of 0' do
      expect(card.balance).to eq (0)
    end
  end
  describe '#top_up' do
    it 'should respond to top_up with 1 argument' do
      expect(card).to respond_to(:top_up).with(1).argument
    end
    it 'should top up the card with the amount given' do
      expect{ card.top_up(1) }.to change{ card.balance }.by 1
    end
     it 'should raise an error when balance exceeds the max limit' do
       limit = Card::LIMIT
       card.top_up(limit)
       expect{ card.top_up 1 }.to raise_error "Maximum limit of #{limit} reached"
     end
  end
  # describe '#deduct' do
  #   subject(:card) { described_class.new }
  #   it 'should respond to deduct with 1 argument' do
  #     expect(card).to respond_to(:deduct).with(1).argument
  #   end
  #   it 'should deduct amount given from the balance' do
  #     card.top_up(30)
  #     expect{ card.deduct 1 }.to change{ card.balance }.by -1
  #   end
  # end
  describe '#touch_in' do
    it 'should set in_journey? to true' do
      card.top_up(10)
      expect{ card.touch_in(:entry_station) }.to change{card.in_journey?}.from(false).to(true)
    end
    it 'should not let me touch_in if the balance is less than 1' do
       expect{ card.touch_in(:entry_station) }.to raise_error "Minimum balance to touch in"
    end
  end
  describe '#touch_out' do
      it 'should change in_journey? from true to false' do
        card.top_up(10)
        card.touch_in(:entry_station)
        expect{ card.touch_out(:exit_station) }.to change{card.in_journey?}.from(true).to(false)
      end
      it 'should deduct minimum fare from card for touch_out' do
        expect{ card.touch_out(:exit_station) }.to change{ card.balance }.by (-Card::MINIMUM_FARE)
      end

    end
   describe '#in_journey?' do
     it 'should set in_journey? to be false' do
       expect(card.in_journey?).to be false
       end
   end

   describe 'entry station' do

     it 'store the entry station on touch_in' do
       card.top_up(10)
       expect{ card.touch_in(:entry_station) }.to change{ card.entry_station }.from(nil).to(:entry_station)
     end
     it'should forget the entry station on touch_out' do
       card.top_up(10)
       card.touch_in(:entry_station)
       expect{ card.touch_out(:exit_station) }.to change{ card.entry_station }.from(:entry_station).to(nil)
     end

   end

   describe 'journeys list' do
     it 'journeys is empty by default' do
       expect(card.journeys.empty?). to be true
     end

     it 'should store the journeys on touch_out' do
       card.top_up(10)
       card.touch_in(:entry_station)
       expect{ card.touch_out(:exit_station) }.to change{card.journeys.empty?}.from(true).to(false)
     end
   end

end

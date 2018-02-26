require 'card'
describe Card do
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
      expect{ card.top_up 1 }.to change{ card.balance }.by 1
    end
     it 'should raise an error when balance exceeds the max limit' do
       limit = Card::LIMIT
       card.top_up(limit)
       expect{ card.top_up 1 }.to raise_error "Maximum limit of #{limit} reached"
     end
  end
  describe '#deduct' do
    subject(:card) { described_class.new }
    it 'should respond to deduct with 1 argument' do
      expect(card).to respond_to(:deduct).with(1).argument
    end
    it 'should deduct amount given from the balance' do
      card.top_up(30)
      expect{ card.deduct 1 }.to change{ card.balance }.by -1
    end
  end
end

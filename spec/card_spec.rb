require 'card'
describe Card do
  describe '#balance' do
    it 'should return balance of 0' do
      expect(subject.balance).to eq (0)
    end
  end
  describe '#top_up' do
    it 'should respond to top_up with 1 argument' do
    expect(subject).to respond_to(:top_up).with(1).argument
   end
    it 'should top up the card with the amount given' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1

    end
  end
end

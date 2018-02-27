require 'journey'

describe Journey do

  context '2 stations given as parameters' do
    subject(:journey) { described_class.new("Feltham", "Monument") }
    it 'Fare should be set to minimum' do
      expect(journey.fare).to eq(Journey::MINIMUM_FARE)
    end

    it 'should check for the entry station' do
      expect(journey.entry_station).to eq "Feltham"
    end

    it 'should check for the exit station' do
      expect(journey.exit_station).to eq "Monument"
    end
  end

    context 'entry station is nil' do
      subject(:journey) { described_class.new(nil, :exit_station) }
      it 'fare is set to penalty fare' do
        expect(journey.fare).to eq (Journey::PENALTY_FARE)
      end
    end
   context 'exit station is nil' do
     subject(:journey) { described_class.new(:entry_station, nil) }
     it 'fare is set to penalty fare' do
       expect(journey.fare).to eq (Journey::PENALTY_FARE)
     end
     end
end

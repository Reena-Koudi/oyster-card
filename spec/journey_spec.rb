require 'journey'

describe Journey do
subject(:journey) { described_class.new }
  context 'Initilization' do
    it 'set single_journey to an empty array' do
      expect(journey.journeys_log).to eq []
    end
    it 'set entry_station to nil' do
      expect(journey.single_journey[:entry]).to eq nil
    end
    it 'set exit_station to nil' do
      expect(journey.single_journey[:exit]).to eq nil
    end
end
    # it 'should check for the entry station' do
    #   expect(journey.entry_station).to eq :entry_station
    # end
    #
    # it 'should check for the exit station' do
    #   expect(journey.exit_station).to eq :exit_station
    # end


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

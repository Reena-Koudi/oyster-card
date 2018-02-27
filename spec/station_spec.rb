require 'station'
describe Station do
  subject(:station) {described_class.new("London", 2) }
  it 'should return the name of the station' do
    expect(station.name).to eq "London"
  end
  it 'should return the zone of the station' do
    expect(station.zone).to eq 2
  end
end

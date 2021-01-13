require 'journey'

describe Journey do
  subject(:journey) { described_class.new }

  context 'initializes' do
    it 'with an entry station' do
      expect(journey.entry_station).to eq("Not tapped in")
    end
  end

end

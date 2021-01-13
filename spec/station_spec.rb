require 'station'

describe Station do
  subject(:station) { described_class.new("Bank", 1) }
  
  context 'initalize' do
    it 'with the name "Bank"' do
      expect(station.name).to eq("Bank")
    end

    it "has correct zone" do
      expect(station.zone).to eq(1)
    end
  end
end

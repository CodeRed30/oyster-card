require 'station'

describe Station do
  subject(:station) { described_class.new("Bank", 1) }
  context 'initalize' do
    it 'with the name "Bank"' do
      expect(subject.name).to eq("Bank")
    end

    it "has correct zone" do
      expect(subject.zone).to eq(1)
    end
  end
end

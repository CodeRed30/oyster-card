require 'station'

describe Station do
# let(:station){ { name: "Bank", zone: 1 } }
subject(:station) { described_class.new("Bank", 1) }
  context 'initalize' do
    it { is_expected.to respond_to(:name) }

    it 'with the name "Bank"' do
      expect(subject.name).to eq("Bank")
    end

    it "has correct zone" do
      expect(subject.zone).to eq(1)
    end
  end
end

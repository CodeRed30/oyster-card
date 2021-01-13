require 'station'

describe Station do
let(:station){ { name: "Bank" } }
  context 'initalize' do
    it { is_expected.to respond_to(:name) }

    it 'with the name "Bank"' do
      expect(subject.name).to eq(station[:name])
    end
  end
end

require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station}
  let(:journey){ { entry_station: entry_station, exit_station: exit_station } }
  it 'has a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  context 'top up' do
    before do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.topup(maximum_balance)
    end

    it "the balance" do
      expect(subject.balance).to eq(90)
    end

    it 'limits the balance to a maximum of £90' do
      expect { subject.topup(1) }.to raise_error "Maximum balance of £#{Oystercard::MAXIMUM_BALANCE} exceeded"
    end

    it "deducts fare from balance" do
      subject.deduct(4)
      expect(subject.balance).to eq(86)
    end
  end

  it 'is initially not in a journey' do
    expect(subject.in_journey).not_to be true
  end

  it 'should raise error: insufficient funds if funds are less than £1' do
    expect {subject.touch_in(entry_station)}.to raise_error "Insufficient funds"
  end

  it 'has an empty list for journey_history' do
    expect(subject.journey_history).to be_empty
  end

  context 'travelling' do
    before do
      subject.topup(Oystercard::MINIMUM_FARE)
      subject.touch_in(entry_station)
    end

    it 'can touch in' do
      expect(subject.in_journey).to be true
    end

    it 'can touch out' do
      subject.touch_out(exit_station)
      expect(subject.in_journey).not_to be true
    end

    it 'charges minimum fare once user touches out' do
      expect {subject.touch_out(exit_station)}.to change{subject.balance}.by(-1)
    end

    it 'stores the entry station' do
      expect(subject.entry_station).to eq entry_station
    end
    #
    # it 'stores the exit station' do
    #   subject.touch_out(exit_station)
    #   expect(subject.exit_station).to eq exit_station
    # end

    it 'stores one journey' do
      subject.touch_out(exit_station)
      expect(subject.journey_history).to include(journey)
    end
  end
end

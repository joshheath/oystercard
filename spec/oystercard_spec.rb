require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:min_balance) { described_class::MINIMUM_BALANCE }
  let(:min_fare) { described_class::MINIMUM_FARE }

  context '#initialize' do
    it 'starts with a balance of zero' do
      expect(subject.balance).to be == 0
    end
  end

  context "#balance" do
    it "Return the current balance" do
      card = Oystercard.new
      card.balance
      expect(card.balance).to be_an Integer
    end
  end

  context "#top_up" do
    it 'can top up the balance' do
      top_up_amount = Oystercard::MINIMUM_BALANCE
      subject.top_up(top_up_amount)
      expect(subject.balance).to eq min_balance
    end

    it "raises an error if the maximum balance is exceeded" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect{ subject.top_up min_balance }.to raise_error "maximum balance of #{maximum_balance} exceeded."
    end
  end

  context "#in_journey?" do
    it 'knows when it\'s in use' do
      expect(subject).not_to be_in_journey
    end
  end

    context 'touch in' do
      it 'can touch in' do
        subject.top_up(min_balance + 1)
        subject.touch_in(entry_station)
        expect(subject).to be_in_journey
      end

      it 'raises an error if balance is less than minimum' do
        expect{ subject.touch_in(entry_station) }.to raise_error "balance is below £#{Oystercard::MINIMUM_BALANCE}"
      end
    end

  context 'touch out' do
    it 'can touch out' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end

    it 'reduces the card balance by minimum fare' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by -min_fare
    end
  end

  context 'card is already on a journey' do
    it 'stores the entry station' do
      subject.top_up(4)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end

    it 'stores exit station' do
      subject.top_up(4)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
    end
  end
end

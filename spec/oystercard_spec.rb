require 'oystercard'

describe Oystercard do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
  let(:min_balance) { described_class::MINIMUM_BALANCE }
  let(:max_balance) { described_class::MAXIMUM_BALANCE }
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

    it 'raises an error if balance is less than minimum' do
      expect{ subject.touch_in(entry_station) }.to raise_error "balance is below £#{min_balance}"
    end

    it 'can top up the balance' do
      subject.top_up(min_balance)
      expect(subject.balance).to eq min_balance
    end

    it "raises an error if the maximum balance is exceeded" do
      subject.top_up(max_balance)
      expect{ subject.top_up(min_balance) }.to raise_error "maximum balance of £#{max_balance} exceeded."
    end
  end
end

  # context "#in_journey?" do
  #   before do
  #     subject.top_up(10)
  #     subject.touch_in(entry_station)
  #   end
  #
  #   it 'stores the entry station' do
  #     expect(subject.entry_station).to eq entry_station
  #   end
  #
  #   it 'stores exit station' do
  #     subject.touch_out(exit_station)
  #     expect(subject.exit_station).to eq exit_station
  #   end
  #
  #   it 'has an empty list of journeys by default' do
  #     expect(subject.journeys).to be_empty
  #   end
  #
  #   it 'stores a journey' do
  #     subject.touch_out(exit_station)
  #     expect(subject.journeys).to include journey
  #   end

  # context 'touch out' do
  #   it 'can touch out' do
  #     subject.touch_out(exit_station)
  #     # expect(subject).not_to be_in_journey
  #   end

    # it 'reduces the card balance by minimum fare' do
    #   expect { subject.touch_out(exit_station) }.to change { subject.balance }.by -min_fare

    # end
  # end
# end


    # it 'stores a journey' do
    #   subject.top_up(4)
    #   subject.touch_in(entry_station)
    #   subject.touch_out(exit_station)
    #   expect(subject.journeys). to include journey
    # end


    # it 'knows when it\'s in use' do
    #   expect(subject).not_to be_in_journey
    # end

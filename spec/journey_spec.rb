# require 'oystercard'
# require 'journey'
#
# describe Oystercard do
#   let(:entry_station) { double :station }
#   let(:exit_station) { double :station }
#   let(:journey){ {entry_station: entry_station, exit_station: exit_station} }
#   let(:min_balance) { described_class::MINIMUM_BALANCE }
#   let(:min_fare) { described_class::MINIMUM_FARE }
#
#   context "#in_journey?" do
#     it 'knows when it\'s in use' do
#       expect(subject).not_to be_in_journey
#     end
#
#     it 'raises an error if balance is less than minimum' do
#       expect{ subject.touch_in(entry_station) }.to raise_error "balance is below £#{Oystercard::MINIMUM_BALANCE}"
#     end
#
#     it 'stores the entry station' do
#       subject.top_up(4)
#       subject.touch_in(entry_station)
#       expect(subject.entry_station).to eq entry_station
#     end
#
#     it 'stores exit station' do
#       subject.top_up(4)
#       subject.touch_in(entry_station)
#       subject.touch_out(exit_station)
#       expect(subject.exit_station).to eq exit_station
#     end
#   end
#
#   context 'touch out' do
#     it 'can touch out' do
#       subject.top_up(10)
#       subject.touch_in(entry_station)
#       subject.touch_out(exit_station)
#       expect(subject).not_to be_in_journey
#     end
#
#     it 'reduces the card balance by minimum fare' do
#       subject.top_up(10)
#       subject.touch_in(entry_station)
#       expect { subject.touch_out(exit_station) }.to change { subject.balance }.by -min_fare
#     end
#   end
# end
#     # it 'has an empty list of journeys by default' do
#     #   expect(subject.journeys).to be_empty
#     # end
#
#     # it 'stores a journey' do
#     #   subject.top_up(4)
#     #   subject.touch_in(entry_station)
#     #   subject.touch_out(exit_station)
#     #   expect(subject.journeys).to include journey
#     # end

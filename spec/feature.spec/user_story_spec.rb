# require 'oystercard'
#
# describe 'User Story' do
#   let(:station){ double :station }
#   let(:min_fare) { Oystercard::MINIMUM_FARE }
#
#   # In order to pay for my journey
#   # As a customer
#   # When my journey is complete, I need the correct amount deducted from my card
#   it 'deducts journey cost from card on touch out' do
#     card = Oystercard.new
#     card.top_up(4)
#     card.touch_in(station)
#     card.touch_out
#     expect { card.touch_out }.to change { card.balance}.by -min_fare
#   end
# end

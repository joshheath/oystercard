require 'oystercard'

describe 'User Story' do

  # In order to pay for my journey
  # As a customer
  # When my journey is complete, I need the correct amount deducted from my card
  it 'deducts journey cost from card on touch out' do
    card = Oystercard.new
    card.top_up(4)
    card.touch_in
    card.touch_out
    expect { card.touch_out }.to change { card.balance}.by -2
  end
end

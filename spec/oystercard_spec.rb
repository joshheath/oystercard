require 'oystercard'

describe Oystercard do
  context "#balance" do
    it "Return the current balance" do
    card = Oystercard.new
    card.balance
    expect(card.balance).to be_an Integer
  end
end
end

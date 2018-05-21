require 'oystercard'

describe Oystercard do
  context "#balance" do
    it "Return the current balance" do
      card = Oystercard.new
      card.balance
      expect(card.balance).to be_an Integer
    end
  end

  context "#top_up" do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect { subject.top_up 1 }.to change{ subject.balance }.by 1
    end
  end

end

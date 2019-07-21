RSpec.describe Card do
  subject(:card) { Card.new(SPADES, "?", "Stand-in", 0)}

  it "is a value object" do
    expect(card).to be_frozen

    other = Card.new(SPADES, "?", "Stand-in", 0)

    expect(card).to eq(other)
  end

  it "is sortable" do
    other = Card.new(CLUBS, "?", "Stand-in", 0)

    expect(card).to be > other
  end

  it "but they are still unique objects" do
    other = card.dup

    expect(card).to eq(other)
    expect(card).not_to eql(other)
  end
end
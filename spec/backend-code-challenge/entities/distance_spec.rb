RSpec.describe Distance, type: :entity do
  it 'can be initialized with attributes' do
    book = Distance.new(origin: 'A', distance: 10, destination: 'B')
    expect(book.origin).to eq('A')
    expect(book.destination).to eq('B')
    expect(book.distance).to eq(10)
  end
end

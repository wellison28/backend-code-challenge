RSpec.describe Api::Controllers::Calculator::Cost, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[{origin: "A", destination: "C", weight: 1}] }

  it 'is format error' do
    response = action.call({})
    expect(response[0]).to eq 400
  end

  it 'path not exists' do
    response = action.call(params)
    expect(response[0]).to eq 404
  end
end

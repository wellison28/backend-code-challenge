require_relative '../spec_helper.rb'
require_relative '../../main.rb'

RSpec.describe App do
  before(:all) do
    post "/distance", "A B 10"
  end

  it 'should returns correct value' do
    get '/cost?origin=A&destination=B&weight=10'

    expect(last_response.body).to eq("15.0")
  end

  it 'not should find the route' do
    get '/cost?origin=A&destination=Z&weight=10'

    expect(last_response.status).to eq(404)
  end

  it 'status should be success' do
    get '/cost?origin=A&destination=B&weight=10'

    expect(last_response.status).to eq(201)
  end
end
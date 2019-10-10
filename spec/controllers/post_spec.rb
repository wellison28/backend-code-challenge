require_relative '../spec_helper.rb'
require_relative '../../main.rb'

RSpec.describe App do
  it 'success on save data' do
    post '/distance', "A B 10"

    expect(last_response.status).to eq(200)
  end

  it 'success on update data' do
    post '/distance', "A B 30"
    expect(last_response.status).to eq(200)

    get '/cost?origin=A&destination=B&weight=10'
    expect(last_response.body).to eq("45.0")
  end  

  it 'correct calculate value' do
    post '/distance', "A B 10"
    post '/distance', "B C 15"
    post '/distance', "A C 30"

    get '/cost?origin=A&destination=C&weight=5'
    expect(last_response.body).to eq("18.75")
  end  
end
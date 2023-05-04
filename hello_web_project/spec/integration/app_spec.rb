require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context ' GET /hello' do
    it 'should return "Hello Leo!"' do
      response = get('/hello?name=Leo')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Leo!")
    end

    it 'should return "Hello Alice!"' do
      response = get('/hello?name=Alice')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Alice!")
    end
  end

  context 'GET /names' do
    it 'return the list of names' do
      response = get('/names?names=Julia,%20Mary,%20Karim')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Julia, Mary, Karim')
    end
  end

  context 'POST /sort-names' do
    it 'returns a list of the sorted names' do
      response = post('/sort-names', names: 'Joe,Alice,Zoe,Julia,Kieran')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
  end

  context 'GET /' do
    it 'returns the html message with the name Alice' do
      response = get('/', name: 'Alice')

      expect(response.body).to include('<h1>Hello, Alice!</h1>')
    end

    it 'returns the html message with the name Chris' do
      response = get('/', name: 'Chris')

      expect(response.body).to include('<h1>Hello, Chris!</h1>')
    end
  end
end

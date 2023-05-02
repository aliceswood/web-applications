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
end

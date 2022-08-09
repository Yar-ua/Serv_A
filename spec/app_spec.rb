require_relative File.expand_path('../app/loader', File.dirname(__FILE__))

RSpec.describe App do
  include Rack::Test::Methods

  let(:app) { Rack::Builder.parse_file('config.ru').first }
  let(:urls) { Config::URLS }

  describe 'have nesessary headers' do
    before { get '/not_found' }

    it { expect(last_response.headers['X-Service-Name']).to eq(Config::SERVICE_NAME) }
    it { expect(last_response.headers['Content-Type']).to eq('application/json') }
  end

  describe 'when user unauthorised' do
    before { get urls[:ping] }

    it { expect(last_response.status).to eq(Constants::CODE_401) }
    it { expect(last_response.body).to include 'unauthorized' }
  end

  describe 'when user get test page' do
    before { get urls[:test] }

    it { expect(last_response.status).to eq(Constants::CODE_200) }
    it { expect(last_response.body).to include 'response from test route was successful' }
  end

  describe 'when user get ping page' do
    describe 'when not auth' do
      before { get urls[:ping] }

      it { expect(last_response.status).to eq(Constants::CODE_401) }
      it { expect(last_response.body).to include 'unauthorized' }
    end

    describe 'when authorized' do
      before { get urls[:ping], API_TOKEN: Config::API_TOKEN }

      it { expect(last_response.status).to eq(Constants::CODE_200) }
      it { expect(last_response.body).to include 'ping message' }
    end
  end
end

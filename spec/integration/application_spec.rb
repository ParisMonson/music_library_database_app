require "spec_helper"
require "rack/test"
require "sinatra"
require_relative '../../app'

def reset_table
  seed_sql = File.read('/Users/paris/Desktop/Projects/music_library_database_app/spec/seeds/music_library.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
  before(:each) do
    reset_table
  end

  context "POST /albums" do
    it 'returns 200 OK' do
      response = post('/albums', params={:title => 'Voyage', :release_year => 2022, :artist_id => 2})
    end
  end
  context "GET /artists" do
    it "returns 200 Ok and all the artists" do
      response = get('/artists')
      expect(response.status).to eq 200
      expect(response.body).to include '<body>'
      expect(response.body).to include '<h1>'
      expect(response.body).to include '<div>'
      expect(response.body).to include '</a>'
    end
  end
  context "GET /artists/new" do
    it "returns 200 Ok" do
      response = get('/artists/new')
      expect(response.status).to eq 200
      expect(response.body).to include '<body>'
      expect(response.body).to include '</form>'
    end
  end


  context "POST /artists" do
    it "returns 200 OK" do
      response = post("/artists", params={name: "Wild nothing", genre: "Indie"})
      expect(response.status).to eq 200
    end
  end

  context "GET /albums/:id" do
    it "returns 200 Ok and the correct album" do

      response = get("/albums/1")
      expect(response.status).to eq 200
      expect(response.body).to include("<h1>Doolittle</h1>")
    end
  end
  context "GET /albums" do
    it "returns 200 OK" do
      response = get("/albums")
      expect(response.status).to eq 200
      expect(response.body).to include("<h1>Albums</h1>")
      expect(response.body).to include("<div>")
    end
  end
  context "GET /albums/new" do
    it "returns 200 OK" do
      response = get("/albums/new")
      expect(response.status).to eq 200
      expect(response.body).to include("</form>")
      expect(response.body).to include("<body>")
    end
  end
  
  context "GET /artists/:id" do
    it 'returns 200 OK and correct artist information' do

      response = get('/artists/1')
      expect(response.status).to eq(200)
      expect(response.body).to include '<h1>Pixies</h1>'
    end
  end
end

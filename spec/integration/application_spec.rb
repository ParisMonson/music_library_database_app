require "spec_helper"
require "rack/test"
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
      expect(response.status).to eq(200)
      response = get('/albums')
      expect(response.body).to include 'Voyage'
    end
  end
  context "GET /artists" do
    it "returns 200 Ok and all the artists" do
      response = get('/artists')
      expect(response.status).to eq 200
      expect(response.body).to eq "Pixies, ABBA, Taylor Swift, Nina Simone"
    end
  end

  context "POST /artists" do
    it "returns 200 OK" do
      response = post("/artists", params={name: "Wild nothing", genre: "Indie"})
      expect(response.status).to eq 200
      response = get("/artists")
      expect(response.status).to eq 200
      expect(response.body).to include("Wild nothing")
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
      expect(response.body).to include("<div>Title: Doolittle Released: 1989</div>")
    end
  end
end

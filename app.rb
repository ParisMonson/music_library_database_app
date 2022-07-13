# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'
require_relative 'lib/album_repository'
require_relative 'lib/artist_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end

  post "/albums" do
    album = Album.new
    @title = params[:title]
    album.title = params[:title]
    album.release_year = params[:release_year]
    album.artist_id = params[:artist_id]

    repo = AlbumRepository.new
    repo.create(album)
  end
  get "/albums" do
    result = []
    AlbumRepository.new.all.each do |album|
      hash = {}
      hash[:title] = album.title
      hash[:release_year] = album.release_year
      hash[:artist_id] = album.artist_id
      result << hash
    end
    result.to_s
  end

  get "/artists" do
    artists = []
    repo = ArtistRepository.new
    repo.all.each do |artist|
      artists.push(artist.name)
    end
    return artists.join(", ")
  end

  post "/artists" do
    artist = Artist.new
    artist.name = params[:name]
    artist.genre = params[:genre]
    ArtistRepository.new.create(artist)
  end

  get "/" do
    return "Hello World!"
  end

  get "/albums/:id" do
    @id = params[:id]
    album = AlbumRepository.new.find(@id)
    @title = album.title
    @release_year = album.release_year
    @artist = ArtistRepository.new.find(album.artist_id).name
    return erb(:albums)
  end
  
end
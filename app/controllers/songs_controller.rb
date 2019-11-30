class SongController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :'songs/show'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(:name => params[:song][:name])

    artist_entry = params[:song][:arstist]

    if Artist.find_by(:name => artist_entry)
      artist = Artist.find_by(:name => artist_entry)
    else
      artist = Artist.create(:name => artist_entry)
    end
    @song.artist = artist
  end
end

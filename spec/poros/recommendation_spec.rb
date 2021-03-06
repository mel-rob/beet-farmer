require 'spec_helper'
require 'dotenv/load'
require './app/poros/recommendation'

describe "Recommendation", :vcr do
  it 'returns the correct number of playlist objects' do
    params = {
      token: ENV['SPOTIFY_TOKEN'],
      mood: 'chill',
      cuisine: 'italian'
    }

    recommendation = Recommendation.new(params)

    mood_playlists = recommendation.mood_playlists
    cuisine_playlists = recommendation.cuisine_playlists
    combo_playlists = recommendation.combo_playlists

    expect(mood_playlists.length).to eq 5
    expect(cuisine_playlists.length).to eq 5
    expect(combo_playlists.length).to eq 5

    mood_playlists.each do |playlist|
      expect(playlist.owner).to include('spotify')
    end

    cuisine_playlists.each do |playlist|
      expect(playlist.owner).to include('spotify')
    end
  end
end
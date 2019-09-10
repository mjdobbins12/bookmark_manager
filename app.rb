require 'sinatra/base'

class Bookmark < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    bookmarks = [
      "https://www.google.com/,
    https://twitter.com/?lang=en,
    https://www.bbc.com/news"
    ]

    bookmarks.join
  end

  run! if app_file == $PROGRAM_NAME
end

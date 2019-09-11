require 'sinatra/base'

class Bookmark < Sinatra::Base
  get '/' do # I have called the spec for this route 'home_spec'
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = [
      "https://www.google.com/",
    "https://twitter.com/?lang=en",
    "https://www.bbc.com/news"
    ]

    erb :"bookmarks/index"
  end

  run! if app_file == $PROGRAM_NAME
end

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  post '/bookmarks' do
    Bookmark.add(params[:url], params[:title])
    redirect to('/bookmarks')
  end

  get '/bookmarks/add' do
    erb :"bookmarks/add"
  end

  delete '/bookmarks/:id' do
    p params
    Bookmark.delete(params[:id])
    redirect to('/bookmarks')
  end

  run! if app_file == $PROGRAM_NAME
end

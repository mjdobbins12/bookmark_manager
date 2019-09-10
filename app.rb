# frozen_string_literal: true

require 'sinatra/base'

class Bookmark < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  run! if app_file == $PROGRAM_NAME
end

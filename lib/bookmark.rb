require 'pg'
require 'sinatra/base'

class Bookmark
  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    bookmarks_all_data = conn.exec( "SELECT * FROM bookmarks" )
    bookmarks_all_data.map { |row| Bookmark.new(row['id'], row['url'], row['title']) }
  end

  def self.add(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    conn.prepare("add_url", "INSERT INTO bookmarks (url, title) VALUES($1, $2)")
    conn.exec_prepared("add_url", [url, title])
  end
end

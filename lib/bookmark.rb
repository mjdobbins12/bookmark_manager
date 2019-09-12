require 'pg'
require 'sinatra/base'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    bookmarks_all_data = conn.exec( "SELECT * FROM bookmarks" )
    bookmarks_all_data.map { |row| row['url'] }
  end

  def self.add(url)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    conn.prepare("add_url", "INSERT INTO bookmarks (url) VALUES($1)")
    conn.exec_prepared("add_url", [url])
  end
end

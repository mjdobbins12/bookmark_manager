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
    conn = Bookmark.connect
    bookmarks_all_data = conn.exec( "SELECT * FROM bookmarks" )
    bookmarks_all_data.map { |row| Bookmark.new(row['id'], row['url'], row['title']) }
  end

  def self.add(url, title)
    conn = Bookmark.connect
    conn.prepare("add_url", "INSERT INTO bookmarks (url, title) VALUES($1, $2)")
    conn.exec_prepared("add_url", [url, title])
  end

  def self.delete(id)
    conn = Bookmark.connect
    conn.exec( "DELETE FROM bookmarks WHERE id = #{id};" )
  end

  private_class_method

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
  end
end

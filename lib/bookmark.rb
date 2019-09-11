require 'pg'

class Bookmark
  def self.all
    conn = PG.connect(dbname: 'bookmark_manager')
    bookmarks_all_data = []
    conn.exec( "SELECT * FROM bookmarks" ) do |result|
      result.each do |row|
        bookmarks_all_data << row
      end
      bookmarks_urls = []
      bookmarks_all_data.each do |row|
        bookmarks_urls << row["url"]
      end
      bookmarks_urls
    end
  end
end

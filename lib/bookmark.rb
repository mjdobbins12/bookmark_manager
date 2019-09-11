require 'pg'

class Bookmark
  def self.all
    conn = PG.connect(dbname: 'bookmark_manager')
    bookmarks_all_data = conn.exec( "SELECT * FROM bookmarks" )
        bookmarks_all_data.map do |row|
        row['url']
      end
  end
end

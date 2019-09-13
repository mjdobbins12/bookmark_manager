require 'bookmark'

describe Bookmark do
    it 'returns all bookmarks with the all method' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy All Software');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

      bookmarks = Bookmark.all.inspect

      expect(bookmarks).to include('Makers')
      expect(bookmarks).to include('Destroy All Software')
      expect(bookmarks).to include('Google')
    end
end

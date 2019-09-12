require 'pg'

def setup
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks;")
end

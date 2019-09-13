feature 'Viewing bookmarks index' do
  scenario "visit '/bookmarks' and see a list of bookmark (URLs)" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")
    visit '/bookmarks'
    expect(page).to have_content 'Makers'
    expect(page).to have_content 'Google'
  end
end

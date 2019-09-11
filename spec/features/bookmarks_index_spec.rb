feature 'Viewing bookmarks index' do
  scenario "visit '/bookmarks' and see a list of bookmark (URLs)" do
    visit '/bookmarks'
    expect(page).to have_content 'https://www.google.com/'
    expect(page).to have_content 'https://twitter.com/?lang=en'
    expect(page).to have_content 'https://www.bbc.com/news'
  end
end

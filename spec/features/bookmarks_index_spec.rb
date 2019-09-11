feature 'Viewing bookmarks index' do
  scenario "visit '/bookmarks' and see a list of bookmark (URLs)" do
    visit '/bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://askjeeves.com'
    expect(page).to have_content 'http://www.google.com'
  end
end

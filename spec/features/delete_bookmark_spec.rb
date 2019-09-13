feature 'deleting bookmarks' do
  scenario 'clicking the delete button removes a bookmark' do
    visit('/bookmarks/add')
    fill_in('url', with: "http://www.youtube.com")
    fill_in('title', with: "Youtube")
    click_button('Submit')
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_link("Youtube", href: "http://www.youtube.com")
  end
end

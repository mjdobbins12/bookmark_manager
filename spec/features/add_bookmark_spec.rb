feature 'adding new bookmarks' do
  scenario 'a user can use a form to add a bookmark' do
    visit('/bookmarks/add')
    fill_in('url', with: "http://www.youtube.com")
    click_button('Submit')
    expect(page).to have_content("http://www.youtube.com")
  end
end

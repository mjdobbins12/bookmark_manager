feature 'adding new bookmarks' do
  scenario 'a user can use a form to add a bookmark' do
    visit('/bookmarks/add')
    fill_in('url', with: "http://www.youtube.com")
    fill_in('title', with: "Youtube")
    click_button('Submit')
    expect(page).to have_link("Youtube")
  end
end

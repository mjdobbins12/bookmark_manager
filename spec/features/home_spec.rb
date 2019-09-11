feature 'index page' do
  scenario 'shows welcome header' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end

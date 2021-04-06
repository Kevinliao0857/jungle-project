require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do

    @user = User.create! email: 'link@example.com', firstname: 'Link', lastname: 'Zelda', password: 'hyrule', password_confirmation: 'hyrule'

  end

  scenario "user login" do
    visit '/'
    first('ul.nav.navbar-nav.navbar-right').find_link('Login').click
    fill_in 'email', with: 'link@example.com'
    fill_in 'password', with: 'hyrule'
    click_on 'Submit'

    expect(page).to have_content 'Signed in as Link'
    save_screenshot

  end

end
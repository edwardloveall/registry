require 'spec_helper'

feature 'User signs in' do
  context 'with good credentials' do
    scenario 'sees registry path' do
      user = create(:user)
      visit root_path
      click_link 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password_digest
      click_button 'Sign in'

      expect(current_path).to eq(registry_root_path)
    end
  end

  context 'with bad credentials' do
    scenario 'sees sign in path' do
      user = create(:user)
      visit root_path
      click_link 'Sign in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: 'not correct'
      click_button 'Sign in'

      expect(current_path).to eq(session_path)
      expect(page).to have_css('input#session_email')
    end
  end
end

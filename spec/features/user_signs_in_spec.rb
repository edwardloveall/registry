require 'spec_helper'

feature 'User signs in' do
  context 'with good credentials' do
    scenario 'sees registry path' do
      sign_in_user

      expect(current_path).to eq(registry_root_path)
      expect(page).to_not have_content('New product')
    end

    context 'as admin user' do
      scenario 'sees admin links' do
        sign_in_user(:admin)

        expect(page).to have_content('New product')
      end
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

require 'spec_helper'

feature 'visitor attempts to see registry data' do
  scenario 'and sees sign in page instead' do
    visit registry_root_path

    expect(current_path).to eq(sign_in_path)
    expect(page).to have_content('You must be signed in')
  end
end

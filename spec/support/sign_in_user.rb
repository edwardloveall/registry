def sign_in_user(type = :user)
  user = create(type)
  visit root_path
  click_link 'Sign in'
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password_digest
  click_button 'Sign in'
end

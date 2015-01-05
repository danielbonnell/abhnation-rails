module Helpers
  module Registration
    def register_user(username, email)
      visit new_user_registration_path
      byebug
      fill_in 'user[username]', with: username
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: 'password'
      fill_in 'user[password_confirmation]', with: 'password'

      click_button 'Register'
    end
  end

  RSpec.configure do |config|
    config.include Registration, :type => :feature
  end
end

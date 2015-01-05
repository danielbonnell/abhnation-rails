module Helpers
  module Registration
    def register_user(username, email)
      visit new_user_registration_path
      save_and_open_page
      fill_in 'Username', with: username
      fill_in 'Email', with: email
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_button 'Register'
    end
  end

  RSpec.configure do |config|
    config.include Registration, :type => :feature
  end
end

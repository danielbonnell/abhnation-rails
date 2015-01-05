module Helpers
  module Registration
    def register_user(username, email)
      visit new_user_session_path

      within "#new_user" do
        fill_in 'Username', with: username
        fill_in 'Email', with: email
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'

        click_button 'Log in'
      end
    end
  end

  RSpec.configure do |config|
    config.include Registration, :type => :feature
  end
end

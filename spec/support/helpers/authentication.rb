module Helpers
  module Authentication
    def log_in_as(user)
      visit new_user_session_path

      within "#new_user" do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_on "Log in"
      end
    end
  end

  RSpec.configure do |config|
    config.include Authentication, :type => :feature
  end
end

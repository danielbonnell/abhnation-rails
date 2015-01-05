require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "lafiel.abriel#{n}@abhnation.com" }
    sequence(:username) { |n| 'Lafiel_Abriel#{n}'}
    password 'password'
    password_confirmation 'password'
  end

end

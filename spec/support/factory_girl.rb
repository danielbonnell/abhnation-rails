require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "lafiel.abriel#{n}@abhnation.com" }
    username
    password 'password'
    password_confirmation 'password'
  end

  factory :article do
    sequence(:title) { |n| "Knowledge base article ##{n}" }
    sequence(:slug) { |n| "Article #{n}"}
    text Faker::Lorem.words(100).join(' ')
    user
    category
  end

  factory :category do
    sequence(:name) { |n| "Category ##{n}" }
    parent_id nil
    display_index 1
    user
  end

  sequence :username do |n|
    "Lafiel_Abriel_#{n}"
  end
end

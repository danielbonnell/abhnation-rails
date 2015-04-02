require 'rails_helper'

RSpec.describe Article, :type => :model do
  context 'Create new article.' do
    text = Faker::Lorem.words(100).join('')

    let(:article) do
      FactoryGirl.create(
        :article,
        title: "Test Article",
        slug: "Test Article",
        text: text
      )
    end

    it "To have a title." do
      expect(article.title).to eq("Test Article")
    end

    it "To have a slug." do
      expect(article.slug).to eq("Test Article")
    end

    it "To have text." do
      expect(article.text).to eq(text)
    end

    it "To belong to a category." do
      expect(article).to_not eq(nil)
    end

    it "To belong to a user." do
      expect(article).to_not eq(nil)
    end
  end
end

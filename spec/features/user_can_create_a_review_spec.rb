require 'rails_helper'
  describe 'book show page' do
    context 'as a user' do
      it 'can create a review' do
        book_1 = Book.create(title: "dans amazing book", pages: 4, year: 2012, image_url: "place")
        book_2 = Book.create(title: "daves amazing book", pages: 5, year:2016, image_url: "otherplace")


        book_1.authors.create(name: "Author One")
        book_2.authors.create(name: "Author Two")


        visit book_path(book_1)

        expect(page).to have_link("Create Review")

        click_on "Create Review"

        title = "Words I thought"
        description = "They are good thoughts"
        score = 5
        user_name = "Dave"

        fill_in :review_title, with: title
        fill_in :review_description, with: description
        fill_in :review_score, with: score
        fill_in :review_user, with: user_name

        click_on "Create Review"

        expect(current_path).to eq(book_path(book_1))

        save_and_open_page
      end
    end
  end

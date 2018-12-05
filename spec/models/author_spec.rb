require 'rails_helper'

 describe Author, type: :model do
    describe "validations" do
      it {should validate_presence_of(:name)}
    end
    describe "relationships" do
      it {should have_many(:books)}
      it {should have_many(:book_authors)}
    end
  end

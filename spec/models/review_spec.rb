require 'rails_helper'

describe Review, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:score)}
  end

  describe "relationships" do
    it {should belong_to(:book)}
  end
end 

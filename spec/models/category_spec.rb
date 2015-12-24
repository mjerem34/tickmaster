require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @cat = {name: 'test'}
  end

  it "should be create new cat" do
    cat = Category.create!(@cat)
    expect(cat).to be_valid
  end

  it "should be fail with name empty" do
    emptyname = Category.new(@cat.merge(name: ''))
    expect(emptyname).to_not be_valid
  end

  it "cat should be unique" do
    Category.create!(@cat)
    present = Category.new(@cat.merge(name: 'test'))
    expect(present).to_not be_valid
  end
end

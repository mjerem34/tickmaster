require 'rails_helper'

RSpec.describe Right, type: :model do
  before :each do
    @right = {
      name: 'test',
      content: 'blabla',
      user: 1,
      tech: 1,
      super_tech: 1,
      disp: 1,
      admin: 1
    }
  end

  it "create should be pass" do
    right = Right.create!(@right)
    expect(right).to be_valid
  end

  it "should be fail if name empty" do
    emptyname = Right.new(@right.merge(name: ''))
    expect(emptyname).to_not be_valid
  end
  it "should be fail if content empty" do
    emptycontent = Right.new(@right.merge(content: ''))
    expect(emptycontent).to_not be_valid
  end
  it "should be fail if user empty" do
    emptyuser = Right.new(@right.merge(user: ''))
    expect(emptyuser).to_not be_valid
  end
  it "should be fail if tech empty" do
    emptytech = Right.new(@right.merge(tech: ''))
    expect(emptytech).to_not be_valid
  end
  it "should be fail if super_tech empty" do
    emptysuper_tech = Right.new(@right.merge(super_tech: ''))
    expect(emptysuper_tech).to_not be_valid
  end
  it "should be fail if disp empty" do
    emptydisp = Right.new(@right.merge(disp: ''))
    expect(emptydisp).to_not be_valid
  end
  it "should be fail if admin empty" do
    emptyadmin = Right.new(@right.merge(admin: ''))
    expect(emptyadmin).to_not be_valid
  end

  it "name should be unique" do
    Right.create!(@right)
    present = Right.new(@right.merge(name: 'test'))
    expect(present).to_not be_valid
  end
  it "content should be unique" do
    Right.create!(@right)
    present = Right.new(@right.merge(content: 'blabla'))
    expect(present).to_not be_valid
  end

end

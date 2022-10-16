require 'rails_helper'

describe Album do
  it { should have_many(:songs)}
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(100) }
  it("titlecases the name of an album") do
    album = Album.create({name: "giant step", genre: "jazz"})
    expect(album.name()).to(eq("Giant Step"))
  end
end
require 'rails_helper'

describe "the add a album process" do
  before do
    User.destroy_all
    admin = User.create(email: "Ryan", admin: true, password: "p4ssw0rd")
    visit albums_path
    click_on "Sign in"
    fill_in "Email", :with => 'Ryan'
    fill_in "Password", :with => 'p4ssw0rd'
    click_button "Sign in"
  end

  it "adds a new album" do
    visit albums_path
    click_button'Create new album'
    fill_in 'Name', :with => 'Giant Steps'
    fill_in 'Genre', :with => 'Jazz'
    click_on 'Create Album'
    expect(page).to have_content 'Album successfully added!'
    expect(page).to have_content 'Giant Steps'
  end

  it "gives an error when no name is entered" do
    visit new_album_path
    click_on 'Create Album'
    expect(page).to have_content "Name can't be blank"
  end
end
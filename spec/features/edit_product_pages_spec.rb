require 'rails_helper'

describe "the edit a product process" do

  before :each do
    user = User.create(email: 'admin@marios.com', password: 'password', admin: true)
  end

  it "edits a product" do
    new_product = Product.create!({:name => "Pine Nuts", :cost => 5, :country_of_origin => "USA"})
    visit signin_path
    fill_in 'Email', :with => "admin@marios.com"
    fill_in 'Password', :with => "password"
    visit products_path
    click_link 'Pine Nuts'
    click_link 'Edit'
    fill_in 'Cost', :with => "12"
    click_on 'Update Product'
    click_link 'Pine Nuts'
    expect(page).to have_content '12'
  end

  it "gives an error when a field is left blank" do
    new_product = Product.create!({:name => "Turmeric", :cost => 5, :country_of_origin => "USA"})
    visit signin_path
    fill_in 'Email', :with => "admin@marios.com"
    fill_in 'Password', :with => "password"
    visit products_path
    click_link 'Turmeric'
    click_link 'Edit'
    fill_in 'Cost', :with => ""
    click_on 'Update Product'
    expect(page).to have_content "Cost can't be blank"
  end
end
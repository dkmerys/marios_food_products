require 'rails_helper'

describe "the add a product process" do
  
  it "adds a new product" do
    visit signin_path
    fill_in 'Email', :with => "dan@marios.com"
    fill_in 'Password', :with => "password"
    click_on 'Sign In'
    visit products_path
    click_link 'Create new product'
    fill_in 'country of origin', :with => "USA"
    fill_in 'cost', :with => "8"
    fill_in 'name', :with => "miracle whip"
    click_on 'Create Product'
    expect(page).to have_content 'Miracle Whip successfully added'
  end

  it "gives an error when no name is entered" do
    visit signin_path
    fill_in 'Email', :with => "dan@marios.com"
    fill_in 'Password', :with => "password"
    click_on 'Sign In'
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end
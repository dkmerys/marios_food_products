require 'rails_helper'

describe "the delete a product process" do

  before :each do
    user = User.create(email: 'admin@marios.com', password: 'password', admin: true)
  end

  it "deletes a product" do
    new_product = Product.create!({:name => "Ghee", :cost => 5, :country_of_origin => "USA"})
    visit signin_path
    fill_in 'Email', :with => "admin@marios.com"
    fill_in 'Password', :with => "password"
    click_on 'Sign In'
    visit products_path
    click_link ('Ghee')
    click_link 'Delete'
    visit products_path
    expect(page).to_not have_content 'Ghee'
  end
end
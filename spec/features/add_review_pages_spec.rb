require 'rails_helper'

describe "trying to add a review when not logged in" do
  it "attempts to add a revew to a product" do
    visit products_path
      click_link 'Bananas'
      click_link 'Add a review'
      expect(page).to have_content 'You need to be signed in to do that.'
    end
  end

  
describe "the add a review process" do
  it "adds a review to product" do
    new_product = Product.create!({:name => "Bananas", :cost => 75, :country_of_origin => "Guatemala"})
    visit signin_path
    fill_in 'Email', :with => "dan@marios.com"
    fill_in 'Password', :with => "password"
    click_on 'Sign In'
    visit products_path
    click_link 'Bananas'
    click_link 'Add a review'
    fill_in 'Author', :with => "Tom Jones"
    fill_in 'Content body', :with => "Tempora illo enim qui magnam quia cum fugit quis itaque mollitia est dolores explicabo aperiam"
    fill_in 'Rating', :with => 3
    click_on 'Create Review'
    expect(page).to have_content 'Tom Jones'
  end
end
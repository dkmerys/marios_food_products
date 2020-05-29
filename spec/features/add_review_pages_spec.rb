require 'rails_helper'

describe "the add a review process" do
  it "adds a review to product" do
    new_product = Product.create!({:name => "Bananas", :cost => 75, :country_of_origin => "Guatemala"})
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
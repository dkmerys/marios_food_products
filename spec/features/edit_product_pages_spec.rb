require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    new_product = Product.create!({:name => "Mayonnaise", :cost => 5, :country_of_origin => "USA"})
    visit products_path
    click_link 'Mayonnaise'
    click_link 'Edit'
    fill_in 'Cost', :with => "12"
    click_on 'Update Product'
    click_link 'Mayonnaise'
    expect(page).to have_content '12'
  end

  it "gives an error when a field is left blank" do
    new_product = Product.create!({:name => "Mayonnaise", :cost => 5, :country_of_origin => "USA"})
    visit products_path
    click_link 'Mayonnaise'
    click_link 'Edit'
    fill_in 'Cost', :with => ""
    click_on 'Update Product'
    expect(page).to have_content "Cost can't be blank"
  end
end
require 'rails_helper'

describe "the delete a product process" do
  it "deletes a product" do
    new_product = Product.create!({:name => "Miracle Whip", :cost => 5, :country_of_origin => "USA"})
    visit products_path
    click_link 'Miracle Whip'
    click_link 'Delete'
    expect(page).to not_have_content 'Miracle Whip'
  end

  it "deletes a product" do
    new_product = Product.create!({:name => "Miracle Whip", :cost => 5, :country_of_origin => "USA"})
    visit products_path
    click_link 'Miracle Whip'
    click_link 'Delete'
    click_button 'Cancel'
    expect(page).to have_content 'Miracle Whip'
  end
end
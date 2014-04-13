require 'spec_helper'

feature 'Product management' do
  before(:each) do
    sign_in_user(:admin)
  end

  scenario 'Admin adds a product' do
    product = build(:product)

    click_link 'New product'
    fill_in 'Name', with: product.name
    fill_in 'Link', with: product.link
    fill_in 'Price', with: product.price
    attach_file 'Image', "#{Rails.root}/spec/assets/image.jpg"
    click_button 'Create Product'

    expect(current_path).to eq(registry_products_path)
    expect(page).to have_content(product.name)
  end
end

require 'spec_helper'

feature 'Product management' do
  before(:each) do
    @product = attributes_for(:product)
    sign_in_user(:admin)
  end

  scenario 'Admin adds a product' do
    expect {
      click_link 'New product'
      fill_in 'Name', with: @product[:name]
      fill_in 'Link', with: @product[:link]
      fill_in 'Price', with: @product[:price]
      attach_file 'Image', "#{Rails.root}/spec/assets/image.jpg"
      click_button 'Create Product'
    }.to change(Product, :count).by(1)

    expect(current_path).to eq(registry_products_path)
    expect(page).to have_content(@product[:name])
  end

  scenario 'Admin adds a bad product' do
    expect {
      click_link 'New product'
      click_button 'Create Product'
    }.to change(Product, :count).by(0)
  end

  scenario 'Admin updates a product' do
    product = create(:product)

    visit registry_products_path
    click_link 'Edit'
    fill_in 'Name', with: 'foo'
    click_button 'Update Product'

    expect(current_path).to eq(registry_products_path)
    expect(page).to have_content('foo')
  end


end

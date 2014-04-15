require 'spec_helper'

feature 'Product management' do
  before(:each) do
    @product = attributes_for(:product)
    create(:product)
  end

  context 'Admin user' do
    before(:each) do
      sign_in_user(:admin)
      visit registry_root_path
    end

    scenario 'Add a product' do
      expect {
        click_link 'New product'
        fill_in 'Name', with: @product[:name]
        fill_in 'Link', with: @product[:link]
        fill_in 'Price', with: @product[:price]
        attach_file 'Image', "#{Rails.root}/spec/assets/image.jpg"
        click_button 'Create Product'
      }.to change(Product, :count).by(1)

      expect(current_path).to eq(registry_root_path)
      expect(page).to have_content(@product[:name])
    end

    scenario 'Add a product with missing parameters' do
      expect {
        click_link 'New product'
        click_button 'Create Product'
      }.to change(Product, :count).by(0)
    end

    scenario 'Update a product' do
      click_link 'Edit'
      fill_in 'Name', with: 'foo'
      click_button 'Update Product'

      expect(current_path).to eq(registry_root_path)
      expect(page).to have_content('foo')
    end

    scenario 'Delete a product' do
      expect {
        click_link 'Remove'
      }.to change(Product, :count).by(-1)
      expect(current_path).to eq(registry_root_path)
    end
  end

  context 'Regular user' do
    before(:each) do
      sign_in_user
    end

    scenario 'User tries to edit a product' do
      visit edit_registry_product_path(Product.first)

      expect(current_path).to eq(registry_root_path)
    end
  end
end

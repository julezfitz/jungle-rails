require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

  scenario "They see product details" do
    # ACT
    visit root_path

    #first(class: 'product').click_link('prod-desc-link')
    #first('.product > prod-desc-link').click
    first('.prod-desc-link').click
    expect(page).to have_css('.prod-desc-link', visible: true)
    #find(first(class: 'product')).visible?
    #first(:h4).click



    # DEBUG / VERIFY
    save_screenshot
  
    expect(page).to have_css('.product-detail', visible: true)
  end

end


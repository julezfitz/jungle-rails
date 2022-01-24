require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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

  scenario "It adds an item to the cart and updates" do
    # ACT
    visit root_path

    within first(".product") do
      click_button "Add"
    end

    # DEBUG / VERIFY
    save_screenshot  
    
    expect(page).to have_content('My Cart (1)')
    
  end

end

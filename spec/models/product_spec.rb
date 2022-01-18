require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    # validation tests/examples here
   
    it "validates :name, presence: true" do
      cat1 = Category.find_or_create_by! name: 'Test'
      @product = cat1.products.create!({
        :name => 'Thingy', 
        :price => 100, 
        :image => 'apparel6.jpg',
        :quantity => 100,
        :category_id => 1 
      })

      name = @product.name ? true: false;
      expect(name).to be true
    end

    it "validates :price, presence: true" do
      cat1 = Category.find_or_create_by! name: 'Test'
      @product = cat1.products.create!({
        :name => 'Thingy', 
        :price => 100, 
        :image => 'apparel6.jpg',
        :quantity => 100,
      })

      price = @product.price ? true: false;
      expect(price).to be true
    end

    it "validates :quantity, presence: true" do
      cat1 = Category.find_or_create_by! name: 'Test'
      @product = cat1.products.create!({
        :name => 'Thingy', 
        :price => 100, 
        :image => 'apparel6.jpg',
        :quantity => 100,
      })

      quantity = @product.quantity ? true: false;
      expect(quantity).to be true
    end

    it "validates :category, presence: true" do
      cat1 = Category.find_or_create_by! name: 'Test'
      @product = cat1.products.create!({
        :name => 'Thingy', 
        :price => 100, 
        :image => 'apparel6.jpg',
        :quantity => 100,
      })

      category = @product.category_id ? true: false;
      expect(category).to be true
    end
  end
end
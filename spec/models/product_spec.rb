require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
   
    it "validates successful create" do
      cat1 = Category.find_or_create_by! name: 'Test'
      @product = cat1.products.create!({
        :name => 'Thingy', 
        :price => 100, 
        :image => 'apparel6.jpg',
        :quantity => 100,
        :category_id => 1 
      })

      expect(@product.errors.full_messages).to be_empty
    end

    it "validates :price, presence: true" do
      cat1 = Category.find_or_create_by! name: 'Test'
      @product = cat1.products.create({
        :name => 'Thingy', 
        :image => 'apparel6.jpg',
        :quantity => 100,
      })

      expect(@product.errors.full_messages).to include ('Price can\'t be blank')
    end

    it "validates :quantity, presence: true" do
      cat1 = Category.find_or_create_by! name: 'Test'
      @product = cat1.products.create({
        :name => 'Thingy', 
        :price => 100, 
        :image => 'apparel6.jpg',
      })

      expect(@product.errors.full_messages).to include ('Quantity can\'t be blank')
    end

    it "validates :category, presence: true" do
      @product = Product.create({
        :name => 'Thingy', 
        :price => 100, 
        :image => 'apparel6.jpg',
        :quantity => 100,
      })

      expect(@product.errors.full_messages).to include ('Category can\'t be blank')
    end

    it "validates :name, presence: true" do
      cat1 = Category.find_or_create_by! name: 'Test'
      @product = cat1.products.create({
        :price => 1000, 
        :image => 'apparel6.jpg',
        :quantity => 5,
      })
      
      expect(@product.errors.full_messages).to include ('Name can\'t be blank')
    end
  end
end
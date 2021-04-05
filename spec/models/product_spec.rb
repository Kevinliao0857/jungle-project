require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    # validation tests/examples here
    it "returns valid product" do
      @category = Category.create(name:"Games")
      product = Product.new(
        name: "Zelda",
        price: 60.00,
        quantity: 50,
        category_id: @category.id
      )
      expect(product).to (be_valid)
    end

    it "return name" do
      @category = Category.create(name:"Games")
      name = Product.new(
        name: "Zelda",
        price: 60.00,
        quantity: 50,
        category_id: @category.id
      )
      expect(name).to (be_valid)
    end

    it "does not return name" do
      @category = Category.create(name:"Games")
      name = Product.new(
        name: nil,
        price: 60.00,
        quantity: 50,
        category_id: @category.id
      )
      expect(name).to_not (be_valid)
    end

    it "returns price" do
      @category = Category.create(name:"Games")
      price = Product.new(
        name: "Zelda",
        price: 60.00,
        quantity: 50,
        category_id: @category.id
      )
      expect(price).to (be_valid)
    end

    it "does not return price" do
      @category = Category.create(name:"Games")
      price = Product.new(
        name: "Zelda",
        price: nil,
        quantity: 50,
        category_id: @category.id
      )
      expect(price).to_not (be_valid)
    end

    it "returns quantity" do
      @category = Category.create(name:"Games")
      quantity = Product.new(
        name: "Zelda",
        price: 60.00,
        quantity: 50,
        category_id: @category.id
      )
      expect(quantity).to (be_valid)
    end

    it "does not return quantity" do
      @category = Category.create(name:"Games")
      quantity = Product.new(
        name: "Zelda",
        price: 60.00,
        quantity: nil,
        category_id: @category.id
      )
      expect(quantity).to_not (be_valid)
    end

    it "returns category" do
      @category = Category.create(name:"Games")
      category_id = Product.new(
        name: "Zelda",
        price: 60.00,
        quantity: 50,
        category_id: @category.id
      )
      expect(category_id).to (be_valid)
    end

    it "does not return category" do
      @category = Category.create(name:"Games")
      category_id = Product.new(
        name: "Zelda",
        price: 60.00,
        quantity: 50,
        category_id: nil
      )
      expect(category_id).to_not (be_valid)
    end

  end



end

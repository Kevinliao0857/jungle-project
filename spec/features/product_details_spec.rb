require 'rails_helper'

# visit the home page
# find (first) product box 
# click blue add button
# check nav to see if cart quantity updated
# click on cart navigation
# check if product is in cart
# check if the price matches (for the prodect added)
# check if item (name) is in the cart

RSpec.feature "PurchaseDetails", type: :feature, js: true do

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

  scenario "They see an individual product details page" do
    visit '/'
    first('article.product').click_on 'Details'

    expect(page).to have_content '64.99'
    save_screenshot
  end
end
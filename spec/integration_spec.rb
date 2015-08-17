require('capybara/rspec')
require('./app')
require('pg')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('/', {:type => :feature}) do
  it('opens the index page correctly') do
    test_restaurant = Restaurant.new({:name => "Brian''s Awesome Sauce", :location => "Beijing", :phone => "503-123-4567"})
    test_restaurant.save()
    visit('/')
    expect(page).to have_content("Restaurants")
    expect(page).to have_button("Add a Restaurant")
    expect(page).to have_content("Beijing")
    expect(page).to have_content("Brian's Awesome Sauce")
  end

  it('adds a restaurant when you click the add button') do
    visit('/')
    fill_in('name', :with => "Brian's Awesome Sauce")
    fill_in('location', :with => "Beijing")
    fill_in('phone', :with => "503-123-4567")
    click_button("Add a Restaurant")
    expect(page).to have_content("Brian's Awesome Sauce")
  end
end

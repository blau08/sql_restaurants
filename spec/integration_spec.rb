require('capybara/rspec')
require('./app')
require('pg')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('/', {:type => :feature}) do
  it('opens the index page correctly') do
    visit('/')
    expect(page).to have_content("Restaurants")
  end
end

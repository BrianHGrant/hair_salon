require('helper_spec')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)

describe('view and add stylist path', {:type => :feature}) do
  it('lists out the stylists in the database') do
    visit('/')
    click_link('Stylists')
    expect(page).to have_content("There are no stylists in the database. Add a stylist below.")
    click_link('Add stylist')
    fill_in('first_name', :with => 'Francis')
    fill_in('last_name', :with => 'Bean')
    click_button('Add')
    expect(page).to have_content("Bean Francis")
  end
end

describe('remove stylist path', {:type => :feature}) do
  it('removes a saved stylist from the database') do
    stylist = Stylist.new({:first_name => 'John', :last_name => 'Waters'})
    stylist.save()
    visit('/stylists')
    click_link("#{stylist.id()}")
    click_button('Remove stylist')
    expect(page).to have_content("There are no stylists in the database. Add a stylist below.")
  end
end

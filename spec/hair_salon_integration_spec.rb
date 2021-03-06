require('helper_spec')
require('capybara/rspec')
require('./app')
require('launchy')
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

describe('update stylist name path', {:type => :feature}) do
  it('updates name of stylist') do
    stylist = Stylist.new({:first_name => 'John', :last_name => 'Waters'})
    stylist.save()
    visit('/stylists')
    click_link("#{stylist.id()}")
    fill_in('new_first_name', :with => 'Francis')
    fill_in('new_last_name', :with => 'Bean')
    click_button('Update')
    expect(page).to have_content("Francis Bean")
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

describe('view and add client path', {:type => :feature}) do
  it('lists out the clients in the database') do
    visit('/')
    click_link('Clients')
    expect(page).to have_content("There are no clients in the database. Add a client below.")
    click_link('Add client')
    fill_in('first_name', :with => 'Francis')
    fill_in('last_name', :with => 'Bean')
    click_button('Add')
    expect(page).to have_content("Bean Francis")
  end
end

describe('remove client path', {:type => :feature}) do
  it('removes a saved client from the database') do
    client = Client.new({:first_name => 'John', :last_name => 'Waters', :stylist_id => 43})
    client.save()
    visit('/clients')
    click_link("#{client.id()}")
    click_button('Remove client')
    expect(page).to have_content("There are no clients in the database. Add a client below.")
  end
end

describe('add a client to the stylist path', {:type => :feature}) do
  it('creates and adds a client to a specific stylist') do
    stylist = Stylist.new({:first_name => 'John', :last_name => 'Waters'})
    stylist.save()
    visit('/stylists')
    click_link("#{stylist.id()}")
    click_button('Add Client')
    fill_in('first_name', :with => 'Francis')
    fill_in('last_name', :with => 'Bean')
    click_button('Add')
    expect(page).to have_content("Bean Francis")
  end
end

describe('update stylist for existing client path', {:type => :feature}) do
  it('updates the assigned stylist for a client') do
    stylist = Stylist.new({:first_name => 'John', :last_name => 'Waters'})
    stylist.save()
    stylist_id = stylist.id().to_i()
    client = Client.new({:first_name => 'Kate', :last_name => 'Winslet', :stylist_id => 43})
    client.save()
    visit('/stylists')
    click_link("#{stylist.id()}")
    click_button('Add Client')
    select('Kate Winslet', :from => 'client_id')
    click_button('Choose')
    expect(page).to have_content("Winslet Kate")
  end
end

describe('update client name path', {:type => :feature}) do
  it('updates name of client') do
    client = Client.new({:first_name => 'John', :last_name => 'Waters', :stylist_id => 43})
    client.save()
    visit('/clients')
    click_link("#{client.id()}")
    fill_in('new_first_name', :with => 'Francis')
    fill_in('new_last_name', :with => 'Bean')
    click_button('Update')
    expect(page).to have_content("Francis Bean")
  end
end

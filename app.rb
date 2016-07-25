require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('./lib/client')
require('pg')

DB = PG.connect({:dbname => 'hair_salon'})


get('/') do
  erb(:index)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/new') do
  erb(:stylist_form)
end

# change to RESTFUL path
post('/add_stylist') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  new_stylist = Stylist.new({:first_name => first_name, :last_name => last_name})
  new_stylist.save()
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist_info)
end

post('/stylists/:id/client') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist_id = params.fetch("stylist_id").to_i()
  @clients = Client.all()
  erb(:stylist_client_form)
end

patch('/stylists/:id/client') do
  stylist_id = params.fetch("stylist_id")
  client_id = params.fetch('client_id').to_i()
  @client = Client.find(client_id)
  @client.update({:stylist_id => stylist_id})
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist_info)
end

patch('/stylists/:id/update') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  first_name = params.fetch('new_first_name')
  last_name = params.fetch('new_last_name')
  @stylist.update_name({:first_name => first_name, :last_name => last_name})
  erb(:stylist_info)
end

post('/stylists/:id/add_client') do
  stylist_id = params.fetch("stylist_id")
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  new_client = Client.new({:first_name => first_name, :last_name => last_name, :stylist_id => stylist_id})
  new_client.save()
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:stylist_info)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.remove()
  @stylists = Stylist.all()
  erb(:stylists)
end

get('/clients') do
  @clients = Client.all()
  erb(:clients)
end

get('/clients/new') do
  erb(:client_form)
end

#change to RESTFUL path
post('/add_client') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  stylist_id = params.fetch("stylist_id")
  new_client = Client.new({:first_name => first_name, :last_name => last_name, :stylist_id => stylist_id})
  new_client.save()
  @clients = Client.all()
  erb(:clients)
end

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  erb(:client_info)
end

post('/clients/:id/stylist') do
  @client = Client.find(params.fetch('id').to_i())
  @client_id = params.fetch("client_id").to_i()
  @stylists = Stylist.all()
  erb(:client_stylist_form)
end

patch('/clients/:id/stylist') do
  @client = Client.find(params.fetch('id').to_i())
  @stylist = Stylist.find(stylist_id = params.fetch("stylist_id").to_i())
  @client.update({:stylist_id => stylist_id})
  erb(:client_info)
end

patch('/clients/:id/update') do
  @client = Client.find(params.fetch('id').to_i())
  first_name = params.fetch('new_first_name')
  last_name = params.fetch('new_last_name')
  @client.update_client({:first_name => first_name, :last_name => last_name})
  erb(:client_info)
end

delete('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.remove()
  @clients = Client.all()
  erb(:clients)
end

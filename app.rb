
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

post('/add_client') do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  new_client = Client.new({:first_name => first_name, :last_name => last_name})
  new_client.save()
  @clients = Client.all()
  erb(:clients)
end

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  erb(:client_info)
end

delete('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.remove()
  @clients = Client.all()
  erb(:clients)
end

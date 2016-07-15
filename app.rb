
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/stylist')
require('pg')

DB = PG.connect({:dbname => 'hair_salon_test'})


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

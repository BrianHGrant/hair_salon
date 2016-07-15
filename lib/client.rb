class Client
  attr_reader(:id, :first_name, :last_name)

  define_method(:initialize) do |attributes|
    @id = attributes[:id] || nil
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients ORDER BY last_name ASC;")
    clients = []
    returned_clients.each do |client|
      id = client.fetch("id").to_i()
      first_name = client.fetch("first_name")
      last_name = client.fetch("last_name")
      clients.push(Client.new({:id => id, :first_name => first_name, :last_name => last_name}))
    end
    clients
  end
end

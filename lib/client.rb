class Client
  attr_reader(:id, :first_name, :last_name, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes[:id] || nil
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @stylist_id = attributes[:stylist_id] || nil
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients ORDER BY last_name ASC;")
    clients = []
    returned_clients.each do |client|
      id = client.fetch("id").to_i()
      first_name = client.fetch("first_name")
      last_name = client.fetch("last_name")
      stylist_id = client.fetch("stylist_id").to_i()
      clients.push(Client.new({:id => id, :first_name => first_name, :last_name => last_name, :stylist_id => stylist_id}))
    end
    clients
  end

  define_method(:==) do |another_client|
    self.id().eql?(another_client.id()).&(self.first_name().eql?(another_client.first_name())).&(self.last_name().eql?(another_client.last_name())).&(self.stylist_id().eql?(another_client.stylist_id()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (first_name, last_name, stylist_id) VALUES ('#{@first_name}', '#{@last_name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:remove) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()}")
  end

  define_singleton_method(:find) do |id|
    found_client = nil
    Client.all().each() do |client|
      if client.id().eql?(id)
        found_client = client
      end
    end
    found_client
  end

  define_method(:stylist) do
    returned_stylist = DB.exec("SELECT first_name, last_name FROM stylists WHERE id = #{self.stylist_id()};")
    stylist = nil
    if returned_stylist.any?()
      first_name = returned_stylist.first().fetch("first_name")
      last_name = returned_stylist.first().fetch("last_name")
      stylist = "" + first_name + " " + last_name + ""
    end
    stylist
  end
end

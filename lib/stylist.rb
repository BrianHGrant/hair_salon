class Stylist
  attr_reader(:id, :first_name, :last_name)

  define_method(:initialize) do |attributes|
    @id = attributes[:id] || nil
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists ORDER BY last_name ASC;")
    stylists = []
    returned_stylists.each do |stylist|
      id = stylist.fetch("id").to_i()
      first_name = stylist.fetch("first_name")
      last_name = stylist.fetch("last_name")
      stylists.push(Stylist.new({:id => id, :first_name => first_name, :last_name => last_name}))
    end
    stylists
  end

  define_method(:==) do |another_stylist|
    self.id().eql?(another_stylist.id()).&(self.first_name().eql?(another_stylist.first_name())).&(self.last_name().eql?(another_stylist.last_name()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (first_name, last_name) VALUES ('#{@first_name}', '#{@last_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
end

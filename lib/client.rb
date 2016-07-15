class Client
  attr_reader(:id, :first_name, :last_name)

  define_method(:initialize) do |attributes|
    @id = attributes[:id] || nil
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
  end
end

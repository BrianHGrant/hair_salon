require('helper_spec')

describe ('Client') do
  describe('#first_name') do
    it('will return the first name of a client') do
      test_client = Client.new(:first_name => "Kate", :last_name => "Winslet")
      expect(test_client.first_name()).to(eq("Kate"))
    end
  end

  describe('#last_name') do
    it('will return the last name of a client') do
      test_client = Client.new(:first_name => "August", :last_name => "West")
      expect(test_client.last_name()).to(eq("West"))
    end
  end

  describe('#id') do
    it('will return the id of a client') do
      test_client = Client.new(:id => 75, :first_name => "August", :last_name => "West")
        expect(test_client.id()).to(eq(75))
    end
  end

  describe('.all') do
    it('will return an empty array if no clients stored in database') do
      expect(Client.all()).to(eq([]))
    end
  end
end

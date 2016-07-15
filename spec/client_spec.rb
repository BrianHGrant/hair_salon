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

  describe('#stylist_id') do
    it('will return the stylist id of a client') do
      test_client = Client.new(:id => 75, :first_name => "August", :last_name => "West", :stylist_id => 25)
        expect(test_client.stylist_id()).to(eq(25))
    end
  end

  describe('.all') do
    it('will return an empty array if no clients stored in database') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('will return true for two clients that are the same') do
      test_client = Client.new(:first_name => "August", :last_name => "West", :stylist_id => 25)
      test_client2 = Client.new(:first_name => "August", :last_name => "West", :stylist_id => 25)
      expect(test_client).to(eq(test_client2))
    end
  end

  describe('#save') do
    it('will store a new Client to the database') do
      test_client = Client.new(:first_name => "August", :last_name => "West", :stylist_id => 25)
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('#remove') do
    it('will remove a Client from the database') do
      test_client = Client.new(:first_name => "August", :last_name => "West", :stylist_id => 25)
      test_client.save()
      test_client.remove()
      expect(Client.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('will find a specific client based on its id') do
      test_client = Client.new(:first_name => "August", :last_name => "West", :stylist_id => 25)
      test_client.save()
      expect(Client.find(test_client.id())).to(eq(test_client))
    end
  end
end

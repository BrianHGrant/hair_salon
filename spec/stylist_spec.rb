require('helper_spec')

describe ('Stylist') do
  describe('#first_name') do
    it('will return the first name of a stylist') do
      test_stylist = Stylist.new(:first_name => "Veronica", :last_name => "Housten")
      expect(test_stylist.first_name()).to(eq("Veronica"))
    end
  end

  describe('#last_name') do
    it('will return the last name of a stylist') do
      test_stylist = Stylist.new(:first_name => "August", :last_name => "West")
      expect(test_stylist.last_name()).to(eq("West"))
    end
  end

  describe('#id') do
    it('will return the id of a stylist') do
      test_stylist = Stylist.new(:id => 75, :first_name => "August", :last_name => "West")
      expect(test_stylist.id()).to(eq(75))
    end
  end

  describe('.all') do
    it('will return an empty array if no stylists stored in database') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('will return true for two stylists that are the same') do
      test_stylist = Stylist.new(:first_name => "August", :last_name => "West")
      test_stylist2 = Stylist.new(:first_name => "August", :last_name => "West")
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe('#save') do
    it('will store a new Stylist to the database') do
      test_stylist = Stylist.new(:first_name => "August", :last_name => "West")
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#remove') do
    it('will remove a Stylist from the database') do
      test_stylist = Stylist.new(:first_name => "August", :last_name => "West")
      test_stylist.save()
      test_stylist.remove()
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('.find') do
    it('will find a specific Stylist based on its id') do
      test_stylist = Stylist.new(:first_name => "August", :last_name => "West")
      test_stylist.save()
      expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

  describe('#clients') do
    it('will return all clients for a stylist, at first empty') do
      test_stylist = Stylist.new(:first_name => "August", :last_name => "West")
      test_stylist.save()
      test_client = Client.new(:first_name => "Kate", :last_name => "Winslet", :stylist_id => test_stylist.id())
      test_client.save()
      test_client2 = Client.new(:first_name => "Joe", :last_name => "Peter", :stylist_id => test_stylist.id())
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client2, test_client]))
    end
  end

  describe('#update') do
    it('will update the first and last name of a stylist') do
      test_stylist = Stylist.new(:first_name => "Kate", :last_name => "Winslet")
      test_stylist.save()
      test_stylist.update({:first_name => "Kathrine", :last_name => "Winslow"})
      expect(test_stylist.first_name).to(eq("Kathrine"))
      expect(test_stylist.last_name).to(eq("Winslow"))
    end
  end

end

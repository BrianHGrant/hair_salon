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
    end
  end
end

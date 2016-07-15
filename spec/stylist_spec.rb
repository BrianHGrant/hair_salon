require('helper_spec')

describe ('Stylist') do
  describe('#first_name') do
    it('will return the first name of a stylist') do
      test_stylist = Stylist.new(:first_name => "Veronica", :last_name => "Housten")
      expect(test_stylist.first_name()).to(eq("Veronica"))
    end
  end
end

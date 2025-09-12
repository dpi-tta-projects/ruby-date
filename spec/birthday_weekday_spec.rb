# spec/birthday_weekday_spec.rb
RSpec.describe "birthday_weekday.rb" do
  describe "output" do
    it "prints Tuesday for 1990-12-25" do
      output = run_script_and_capture_lines("birthday_weekday.rb", stdin: "1990-12-25\n")
      expect(output).to eq(["Tuesday"])
    end

    it "prints Saturday for 2000-01-01" do
      output = run_script_and_capture_lines("birthday_weekday.rb", stdin: "2000-01-01\n")
      expect(output).to eq(["Saturday"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("birthday_weekday.rb")) }

    it "requires 'date'" do
      expect(source_code).to match(/require\s+['"]date['"]/)
    end

    it "uses gets + chomp" do
      expect(source_code).to match(/gets/)
      expect(source_code).to match(/chomp/)
    end

    it "uses Date.parse" do
      expect(source_code).to match(/Date\.parse/)
    end

    it "uses strftime('%A')" do
      expect(source_code).to match(/strftime/)
    end
  end
end

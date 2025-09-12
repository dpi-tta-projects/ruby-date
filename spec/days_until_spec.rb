# spec/days_until_spec.rb
RSpec.describe "days_until.rb" do
  describe "output" do
    it "prints the number of days between 2025-12-30 and 2026-01-01" do
      output = run_script_and_capture_lines("days_until.rb", stdin: "2025-12-30\n2026-01-01\n")
      expect(output).to eq(["2"])
    end

    it "prints 0 when the dates are the same" do
      output = run_script_and_capture_lines("days_until.rb", stdin: "2025-09-10\n2025-09-10\n")
      expect(output).to eq(["0"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("days_until.rb")) }

    it "requires 'date'" do
      expect(source_code).to match(/require\s+['"]date['"]/)
    end

    it "reads two lines with gets + chomp" do
      expect(source_code.scan(/gets/).size).to be >= 2
      expect(source_code).to match(/chomp/)
    end

    it "parses both inputs with Date.parse" do
      expect(source_code.scan(/Date\.parse/).size).to be >= 2
    end

    it "uses Date subtraction" do
      expect(source_code).to match(/-/)
    end

    it "doesn't depend on the system clock" do
      expect(source_code).not_to match(/Date\.today|Time\.now/)
    end
  end
end

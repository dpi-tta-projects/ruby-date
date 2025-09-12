# spec/format_date_spec.rb
RSpec.describe "format_date.rb" do
  describe "output" do
    it "prints a friendly date string for input 2025-09-10" do
      output = run_script_and_capture_lines("format_date.rb", stdin: "2025-09-10\n")
      expect(output).to eq(["September 10, 2025"])
    end

    it "prints a friendly date string for input 2024-01-01" do
      output = run_script_and_capture_lines("format_date.rb", stdin: "2024-01-01\n")
      expect(output).to eq(["January 01, 2024"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("format_date.rb")) }

    it "requires 'date'" do
      expect(source_code).to match(/require\s+['"]date['"]/), "Remember to require 'date'."
    end

    it "uses gets + chomp" do
      expect(source_code).to match(/gets/), "Read input with gets."
      expect(source_code).to match(/chomp/), "Trims input with chomp."
    end

    it "uses Date.parse" do
      expect(source_code).to match(/Date\.parse/), "Use Date.parse to read the input."
    end

    it "uses strftime" do
      expect(source_code).to match(/strftime/), "Use strftime for formatting."
    end

    it "doesn't depend on the system clock" do
      expect(source_code).not_to match(/Date\.today|Time\.now/), "Don't depend on the system clock."
    end
  end
end

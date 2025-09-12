# spec/weekend_checker_spec.rb
RSpec.describe "weekend_checker.rb" do
  describe "output" do
    it "prints 'weekend' for a Saturday (2025-09-13)" do
      output = run_script_and_capture_lines("weekend_checker.rb", stdin: "2025-09-13\n")
      expect(output).to eq(["weekend"])
    end

    it "prints weekday with days until weekend for a Wednesday (2025-09-10)" do
      output = run_script_and_capture_lines("weekend_checker.rb", stdin: "2025-09-10\n")
      expect(output).to eq(["weekday (3 days until weekend)"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("weekend_checker.rb")) }

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

    it "uses saturday?/sunday? predicates" do
      expect(source_code).to match(/saturday\?/)
      expect(source_code).to match(/sunday\?/)
    end

    it "computes days until Saturday using wday" do
      expect(source_code).to match(/wday/)
    end
  end
end

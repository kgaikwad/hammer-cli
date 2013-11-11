require File.join(File.dirname(__FILE__), 'test_helper')


describe String do

  context "formatting" do

    let(:str) { "AA%<a>s BB%<b>s" }
    let(:curly_str) { "AA%{a}s BB%{b}s" }
    let(:pos_str) { "AA%s BB%s" }

    it "should not fail without expected parameters" do
      str.format({}).must_equal 'AA BB'
    end

    it "should replace positional parameters" do
      pos_str.format(['A', 'B']).must_equal 'AAA BBB'
    end

    it "should replace named parameters" do
      str.format(:a => 'A', :b => 'B').must_equal 'AAA BBB'
    end

    it "should replace named parameters with string keys" do
      str.format('a' => 'A', 'b' => 'B').must_equal 'AAA BBB'
    end

    it "should replace named parameters marked with curly brackets" do
      curly_str.format(:a => 'A', :b => 'B').must_equal 'AAA BBB'
    end

  end

end


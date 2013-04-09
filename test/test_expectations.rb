require "minitest/autorun"
require "minitest/rails/shoulda/dsl"
require "minitest/rails/shoulda/assertions"
require "minitest/rails/shoulda/expectations"

describe "Shoulda Style Expectations" do

  context "an array of values" do

    setup do
      @a = ['abc', 'def', 3]
    end

    [/b/, 'abc', 3].each do |x|
      should "contain #{x.inspect}" do
        proc { @a.wont_contain x }.must_raise(MiniTest::Assertion)

        @a.must_contain x
      end
    end

    should "not contain 'wtf'" do
      proc { @a.must_contain 'wtf' }.must_raise(MiniTest::Assertion)

      @a.wont_contain 'wtf'
    end

    should "be the same as another array, ordered differently" do
      @a.must_have_same_elements [3, "def", "abc"]

      proc {
        @a.must_have_same_elements [3, 3, "def", "abc"]
      }.must_raise(MiniTest::Assertion)

      @a.wont_have_same_elements [3, 3, "def", "abc"]

      [@a, "abc"].flatten.must_have_same_elements ["abc", 3, "def", "abc"]

      proc {
        [@a, "abc"].flatten.must_have_same_elements [3, 3, "def", "abc"]
      }.must_raise(MiniTest::Assertion)

      [@a, "abc"].flatten.wont_have_same_elements [3, 3, "def", "abc"]
    end

  end

end

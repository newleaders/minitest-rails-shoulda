module MiniTest
  module Expectations

    ##
    # See MiniTest::Assertions#assert_contains
    #
    #   collection.must_contain "a"
    #   collection.must_contain /a/
    #
    # :method: must_contain

    infect_an_assertion :assert_contains, :must_contain, :reverse

    ##
    # See MiniTest::Assertions#assert_does_not_contain
    #
    #   collection.wont_contain "b"
    #   collection.wont_contain /b/
    #
    # :method: wont_contain

    infect_an_assertion :assert_does_not_contain, :wont_contain, :reverse

    ##
    # See MiniTest::Assertions#assert_same_elements
    #
    #   collection.must_have_same_elements ["a", b, 1]
    #
    # :method: must_have_same_elements

    infect_an_assertion :assert_same_elements, :must_have_same_elements

    ##
    # See MiniTest::Assertions#refute_same_elements
    #
    #   collection.wont_have_same_elements ["b", c, 3]
    #
    # :method: wont_have_same_elements

    infect_an_assertion :refute_same_elements, :wont_have_same_elements
  end
end

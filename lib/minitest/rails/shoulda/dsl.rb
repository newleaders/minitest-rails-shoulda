require "minitest/spec"

# Duck punch MiniTest::Spec to behave more like Shoulda

class MiniTest::Spec < MiniTest::Unit::TestCase
  class << self

    # Add Shoulda DSL
    alias :setup    :before
    alias :teardown :after
    alias :context  :describe
    alias :should   :it

    ##
    # Define a named expectation to be skipped for now.
    # The implementation may or may not be present.
    # The test is listed but does not cause a failure.
    #
    # Add here so we have something to alias later...
    def skip desc = "skipped", &block
      it desc do
        skip desc
      end
    end unless respond_to?(:skip)

    alias :should_eventually :skip
  end
end

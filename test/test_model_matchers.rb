require "rails_helper"

describe Person do

  subject { Person.new }

  describe 'explicit subject' do
    it { subject.must validate_presence_of :name }
  end

  # These are failing because must, wont, self.must and self.wont are defined on
  # MiniTest::Spec
  # (https://github.com/zenspider/minitest-matchers/blob/master/lib/minitest/matchers.rb#L90)
  # Do they need to be defined on MiniTest::Unit::TestCase to work properly?
  #
  #describe 'implicit subject' do
  #  it { must validate_presence_of :name }
  #end

  #describe 'implicit it and subject' do
  #  must { validate_presence_of :name }
  #end

end

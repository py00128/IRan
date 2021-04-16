require 'test_helper'

# tests the help model
class HelpTest < ActiveSupport::TestCase

  # tests whether an empty help cannot be saved
  test 'should not save empty help' do
    help = Help.new # creates a new help

    help.save # attempts to save the help
    refute help.valid? # the help should not be saved
  end

  # tests whether a valid help can be saved
  test 'should save valid help' do
    help = Help.new # creates a new help

    help.name = 'example' # sets the name of the help
    help.email = 'example@example.com' # sets the email of the help
    help.message = 'example' # sets the message of the help

    help.save # attempts to save the help
    assert help.valid? # the help should be saved
  end

  # tests whether a help with an invalid email cannot be saved
  test 'should not save help with invalid email' do
    help = Help.new # creates a new help

    help.name = 'example' # sets the name of the help
    help.email = 'example' # sets the email of the help to an invalid value
    help.message = 1 # sets the message of the help

    help.save # attempts to save the help
    refute help.valid? # the help should not be saved
  end

end

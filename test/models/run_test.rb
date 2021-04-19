require 'test_helper'

#tests the run model
class RunTest < ActiveSupport::TestCase

  # called before every test
  setup do
    @user = users(:one) # sets a property to a user in the database from our fixtures
  end

  # tests whether an empty run cannot be saved
  test 'should not save empty run' do
    run = Run.new # creates a new run

    run.save # attempts to save the run
    refute run.valid? # the run should not be saved
  end

  # tests whether a valid run can be saved
  test 'should save valid run' do
    run = Run.new # creates a new run

    run.user = @user # sets the userID of the run

    run.save # attempts to save the run
    assert run.valid? # the run should be saved
  end

end

require 'test_helper'

# tests the user model
class UserTest < ActiveSupport::TestCase

  # tests whether an empty user cannot be saved
  test 'should not save empty user' do
    user = User.new # creates a new user

    user.save # attempts to save the user
    refute user.valid? # the user should not be saved
  end

  # tests whether a valid user can be saved
  test 'should save valid user' do
    user = User.new # creates a new user

    user.name = 'An Example' # sets the name of the user
    user.age = 1 # sets the age of the user
    user.email = 'example@example.com' # sets the email of the user
    user.encrypted_password = 'example' # sets the encrypted_password of the user
    user.read_terms_and_conditions = '1' # sets the read_terms_and_conditions of the user

    user.save # attempts to save the user
    assert user.valid? # the user should be saved
  end

  # tests whether a user with an invalid name cannot be saved
  test 'should not save user with invalid name' do
    user = User.new # creates a new user

    user.name = 'example' # sets the name of the user to an invalid value
    user.email = 'example@example.com' # sets the emailAddress of the user
    user.age = 1 # sets the age of the user
    user.encrypted_password = 'example' # sets the encrypted_password of the user
    user.read_terms_and_conditions = '1' # sets the read_terms_and_conditions of the user

    user.save # attempts to save the user
    refute user.valid? # the user should not be saved
  end

  # tests whether a user with an invalid emailAddress cannot be saved
  test 'should not save user with an invalid email address' do
    user = User.new # creates a new user

    user.name = 'An Example' # sets the name of the user
    user.age = 1 # sets the age of the user
    user.email = 'example' # sets the email of the user to an invalid value
    user.encrypted_password = 'example' # sets the encrypted_password of the user
    user.read_terms_and_conditions = '1' # sets the read_terms_and_conditions of the user

    user.save # attempts to save the user
    refute user.valid? # the user should not be saved
  end

  # tests whether a user with an invalid age cannot be saved
  test 'should not save user with invalid age' do
    user = User.new # creates a new user

    user.name = 'An Example' # sets the name of the user
    user.age = -1 # sets the age of the user to an invalid value
    user.email = 'example@example.com' # sets the email of the user
    user.encrypted_password = 'example' # sets the encrypted_password of the user
    user.read_terms_and_conditions = '1' # sets the read_terms_and_conditions of the user

    user.save # attempts to save the user
    refute user.valid? # the user should not be saved
  end

  # tests whether a user with an invalid read_terms_and_conditions cannot be saved
  test 'should not save user with invalid read_terms_and_conditions' do
    user = User.new # creates a new user

    user.name = 'An Example' # sets the name of the user
    user.age = -1 # sets the age of the user to an invalid value
    user.email = 'example@example.com' # sets the email of the user
    user.encrypted_password = 'example' # sets the encrypted_password of the user
    user.read_terms_and_conditions = '0' # sets the read_terms_and_conditions of the user to an invalid value

    user.save # attempts to save the user
    refute user.valid? # the user should not be saved
  end

end

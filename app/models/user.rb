# The user model which represents a user of the application.
class User < ActiveRecord::Base
  # The name must contain a forename and surname,
  # both the forename and surname must start with a capital letter
  # and have lower case letters after the capital letter.
  validates :name, format: { with: /\A[A-Z][a-z]+\s[A-Z][a-z]+\Z/,
                             message: 'must have a valid forename and surname' }
  # The emailAddress must be a valid email address.
  # https://stackoverflow.com/questions/22993545/ruby-email-validation-with-regex
  # used to find out what regular expression to use to validate email address.
  validates :emailAddress, format: { with: URI::MailTo::EMAIL_REGEXP ,
                                     message: 'must be a valid email address' }
  # The age must be greater than or equal to 0.
  validates :age, numericality: { greater_than_or_equal_to: 0 }
  # A user can have 0 or more runs.
  # The runs which a user makes must be removed if the user is removed.
  has_many :runs, dependent: :destroy
end

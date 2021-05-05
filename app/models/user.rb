# The user model which represents a user of the application.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # The name must contain a forename and surname,
  # both the forename and surname must start with a capital letter
  # and have lower case letters after the capital letter.
  # The name of the user must not be null.
  validates :name, format: { with: /\A[A-Z][a-z]+\s[A-Z][a-z]+\Z/,
                             message: 'must have a valid forename and surname' }, presence: true
  # The age must be greater than or equal to 0.
  # The age of the user must not be null.
  validates :age, numericality: { greater_than_or_equal_to: 0 }, presence: true
  # The read_terms_and_conditions must be equal to 1.
  validate :terms_and_conditions_must_be_read
  # A user can have 0 or more runs.
  # The runs which a user makes must be removed if the user is removed.
  has_many :runs, dependent: :destroy

  # Checks whether the read_terms_and_conditions_is_equal_to_1.
  def terms_and_conditions_must_be_read
    if :read_terms_and_conditions != "1"
      errors.add(:read_terms_and_conditions, "You must agree to the Terms and Conditions")
    end
  end

  def username
    return email.split('@')[0]
  end
end

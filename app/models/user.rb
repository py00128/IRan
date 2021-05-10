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
  # A user can have 0 or more runs.
  # The runs which a user makes must be removed if the user is removed.
  has_many :runs, dependent: :destroy


  def username
    return email.split('@')[0]
  end
end

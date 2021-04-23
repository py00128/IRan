# The run model which represents a users run.
class Run < ApplicationRecord
  # The user which the run belongs to must not be null.
  validates_presence_of :user
  # The starting_point of the run must not be null.
  validates_presence_of :starting_point
  # The destination of the run must not be null.
  validates_presence_of :destination
  # The date of the run must not be null.
  validates_presence_of :date
  # A run belongs to a user.
  belongs_to :user
end

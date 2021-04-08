# The run model which represents a users run.
class Run < ApplicationRecord
  # The user which the run belongs to must not be null.
  validates_presence_of :userID
  # A run belongs to a user.
  belongs_to :user
end

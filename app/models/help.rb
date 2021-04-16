class Help < ApplicationRecord
  #make sure the user has entered a name
  validates :name, presence: true
  #make sure the user has entered an email
  validates :email, presence: true
  #make sure the user has entered a message
  validates :message, presence: true

  # The emailAddress must be a valid email address.
  # https://stackoverflow.com/questions/22993545/ruby-email-validation-with-regex
  # used to find out what regular expression to use to validate email address.
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP ,
                                     message: 'must be a valid email address' }

end

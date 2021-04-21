class ApplicationMailer < ActionMailer::Base
  default to: "info@iran.com", from: 'from@example.com'
  layout 'mailer'
end

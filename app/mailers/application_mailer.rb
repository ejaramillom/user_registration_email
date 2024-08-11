class ApplicationMailer < ActionMailer::Base
  default from: 'registration@test.com', bcc: 'admin@test', reply_to: 'admin@test.com'
  layout "mailer"
end

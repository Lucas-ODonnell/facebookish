class ApplicationMailer < ActionMailer::Base
  default from: 'welcome@facebookish.com'
  layout 'mailer'
end

class ApplicationMailer < ActionMailer::Base
  default from: "sidekiq@example.com"
  layout "mailer"
end

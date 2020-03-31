class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"#(от кого)
  layout 'mailer'#app/views/layouts mailer
end
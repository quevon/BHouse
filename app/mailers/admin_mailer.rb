class AdminMailer < ApplicationMailer
    default from: 'from@example.com'
    layout 'mailer'
  
    def new_user_waiting_for_approval(email)
      @email = email
      mail(to: 'admin@email.com', subject: 'New user awaiting admin approval')
    end
end

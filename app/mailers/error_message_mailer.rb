class ErrorMessageMailer < ApplicationMailer
  default from: 'Aidys Dongak <aydys@example.org>'

  def notify_error(error)
    @error = error

    mail to: 'aydys@example.com', subject: 'Error Notification'
  end
end

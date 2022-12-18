class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    mail(
      to: ENV['MAIL_ADDRESS'],
      subject: 'ギア編成投稿所より問い合わせが届きました'
    )
  end
end

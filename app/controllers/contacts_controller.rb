class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render new_contact_path
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render new_contact_path
  end

  def done
    @contact = Contact.new(contact_params)
    ContactMailer.send_mail(@contact).deliver_now
    @contact.save
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :message, :email)
    end
end

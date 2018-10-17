class ContactMailer < ApplicationMailer

  def contact(params)
    @contact = params
    mail(to: 'contato@audiencegear.com', subject: 'Contato Website')
  end
end

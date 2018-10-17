class PagesController < ApplicationController

  layout false

  def index
  end

  def send_email
    ContactMailer.contact(params).deliver_now
    redirect_to root_path
  end
end

require 'twilio-ruby'
require './.env.rb'

class TextSender

  attr_reader :sender, :client

  def initialize client
    @sender = "441322721396"
    @client = client
  end

  def send_text to, body
    @client.messages.create(
      body: body,
      to: to,
      from: sender,
      via: client)
  end

end

require 'text_sender'

describe TextSender do

  let(:client) { client = double :client }

  subject do
    TextSender.new client
  end

  it "sends a message" do
    messages = double :messages
    allow(client).to receive(:messages) { messages }
    expect(messages).to receive(:create).with(body: "Test message", to: "447963648096", from: "441322721396", via: client)
    subject.send_text("447963648096", "Test message")
  end

end

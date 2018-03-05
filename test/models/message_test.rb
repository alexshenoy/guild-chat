require 'test_helper'

describe Message do
  it "must have a body" do
    message = Message.new(body: '', user: 'alice')
    message.wont_be :valid?
  end

  it "must have a user" do
    message_without_user = Message.new(body: 'hi', user: nil)
    message_without_user.wont_be :valid?
  end
end

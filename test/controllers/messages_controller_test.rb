require 'test_helper'

describe MessagesController do
  describe :index do
    it "retruns ok" do
      get messages_path
      response.must_be :success?
    end

    it "renders previous messages" do
      get messages_path
      @messages = Message.all
      @messages.each do |message|
        must_select "div.message" do
          must_select "span.message_user", message.user
          must_select "span.message_body", message.body
        end
      end
    end

    it "renders new message form" do
      get messages_path, params: {user: 'alice'}
      must_select "form" do
        must_select 'input[type="hidden"]', 2
        must_select 'input[type="text"]', 1
        must_select 'input[type="submit"]', 1
      end
    end
  end

  describe :create do
    it "knows the truth" do
      true.must_equal true
    end

    it "adds a new message with valid parameters" do
      value {
        post messages_path, params: message_params
      }.must_change 'Message.count', 1
      @response.content_type.must_equal 'application/json'
      json_response_body["status"].must_equal "success"
      json_response_body["message"]["user"].must_equal "alice"
      json_response_body["message"]["body"].must_equal "Hi Mom!"
    end

    it "returns an error with invalid parameters" do
      value {
        post messages_path, params: invalid_message_params
      }.wont_change 'Message.count'
      @response.content_type.must_equal 'application/json'
      json_response_body["status"].must_equal "error"
    end
  end

    private

    def json_response_body
      JSON.parse(@response.body)
    end


    def message_params
      {message: {user: 'alice', body: 'Hi Mom!'}}
    end

    def invalid_message_params
      {message: {user: 'alice', body: ''}}
    end
end

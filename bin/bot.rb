# !/usr/bin/env ruby
require 'telegram/bot'
require_relative '../lib/bot_logic'

token = ENV['TOKEN']

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    unless message.nil?
      message_objs = respond(message.text, message.chat.id, message.from.first_name)
      message_objs&.each do |message_obj|
        bot.api.send_message(message_obj)
      end
    end
  end
end

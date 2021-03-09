require 'telegram/bot'
require_relative '../lib/app_config'
require_relative '../lib/reply'

# token = 'YOUR_TELEGRAM_BOT_API_TOKEN'
token = ENV['TOKEN']
# token = App_Config.token
reply = Reply.new

time = [%w(Launch Breakfast), %w(Dinner)]
Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text:"Hi, #{message.from.first_name}"+reply.reply_txt['welcome'])
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/ask'
      bot.api.send_message(chat_id: message.chat.id, text: reply.reply_txt['ask_category'], reply_markup: reply.keyboard('ask_category'))

    end
    if reply.scrapper.is_category(message.to_s)
      reply.get_suggestions(message)
      bot.api.send_message(chat_id: message.chat.id, 
        text: reply.reply_txt['suggestions'] , 
        reply_markup: reply.keyboard('show_suggestions'))
    elsif reply.scrapper.is_recipe(message.to_s)
      reply.get_recipe(message.to_s)
      bot.api.send_message(chat_id: message.chat.id, text: reply.reply_txt['recipe']) 
    end
  end
end